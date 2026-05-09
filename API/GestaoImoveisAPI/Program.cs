using GestaoImoveisAPI.Application.Billing.AttachPixCharge;
using GestaoImoveisAPI.Application.Reports;
using QuestPDF.Infrastructure;
using GestaoImoveisAPI.Application.Billing.CreateInvoice;
using GestaoImoveisAPI.Application.Billing.MarkOverdue;
using GestaoImoveisAPI.Application.Billing.RegisterPayment;
using GestaoImoveisAPI.Application.Leasing.AddBillToContract;
using GestaoImoveisAPI.Application.Leasing.ApplyReadjustment;
using GestaoImoveisAPI.Application.Leasing.CreateContract;
using GestaoImoveisAPI.Application.Property.AddInspectionReport;
using GestaoImoveisAPI.Application.Property.CreateProperty;
using GestaoImoveisAPI.Application.Property.UpdateProperty;
using GestaoImoveisAPI.Application.Property.UpdateStatus;
using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Application.Identity.ChangePassword;
using GestaoImoveisAPI.Application.Identity.Login;
using GestaoImoveisAPI.Application.Identity.RefreshToken;
using GestaoImoveisAPI.Application.Identity.Register;
using GestaoImoveisAPI.Domain.Billing.Repositories;
using GestaoImoveisAPI.Domain.Identity.Repositories;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using GestaoImoveisAPI.Domain.Leasing.Services;
using GestaoImoveisAPI.Domain.Property.Repositories;
using GestaoImoveisAPI.Infrastructure.ExternalServices;
using GestaoImoveisAPI.Infrastructure.Persistence.Repositories;
using GestaoImoveisAPI.Infrastructure.Persistence.Repositories;
using GestaoImoveisAPI.Middleware;
using GestaoImoveisAPI.Services;
using GestaoImoveisAPI.TokenService;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Threading.RateLimiting;

QuestPDF.Settings.License = LicenseType.Community;

var builder = WebApplication.CreateBuilder(args);

// EF Core — MySQL
var cs = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? throw new InvalidOperationException("Connection string 'DefaultConnection' não configurada.");

// Versão fixa evita round-trip de rede ao iniciar e permite rodar migrations sem DB ativo
builder.Services.AddDbContext<AppDbContext>(opts =>
    opts.UseMySql(cs, new MySqlServerVersion(new Version(8, 0, 33))));

// Controllers e Swagger
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
    options.JsonSerializerOptions.WriteIndented = true;
});
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// CORS — permissivo apenas em Development
if (builder.Environment.IsDevelopment())
{
    builder.Services.AddCors(o => o.AddPolicy("AllowAll",
        p => p.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()));
}
else
{
    builder.Services.AddCors(o => o.AddPolicy("AllowAll",
        p => p.WithOrigins(builder.Configuration.GetSection("AllowedOrigins").Get<string[]>() ?? [])
              .AllowAnyMethod()
              .AllowAnyHeader()));
}

// JWT Authentication
var jwtSecret = builder.Configuration["Jwt:Secret"]
    ?? throw new InvalidOperationException("Jwt:Secret não está configurado.");

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSecret))
        };
    });

// Fallback policy — todos os endpoints requerem autenticação por padrão
builder.Services.AddAuthorizationBuilder()
    .SetFallbackPolicy(new AuthorizationPolicyBuilder()
        .RequireAuthenticatedUser()
        .Build());

// Rate Limiting — máx 5 tentativas de login por minuto por IP
builder.Services.AddRateLimiter(options =>
{
    options.AddFixedWindowLimiter("login", opt =>
    {
        opt.PermitLimit = 5;
        opt.Window = TimeSpan.FromMinutes(1);
        opt.QueueProcessingOrder = QueueProcessingOrder.OldestFirst;
        opt.QueueLimit = 0;
    });
    options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;
});

// Global Exception Handler — único ponto de tratamento de exceções
builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();

// Identity — Domain / Application / Infrastructure
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<RegisterUserHandler>();
builder.Services.AddScoped<LoginHandler>();
builder.Services.AddScoped<RefreshTokenHandler>();
builder.Services.AddScoped<ChangePasswordHandler>();

// Serviços
builder.Services.AddHttpClient<AddressService>();
builder.Services.AddHttpClient<IIbgeIndexService, IbgeIndexService>(client =>
{
    client.BaseAddress = new Uri("https://servicodados.ibge.gov.br/api/v3/");
    client.Timeout = TimeSpan.FromSeconds(10);
});
builder.Services.AddScoped<JwtTokenService>();

// Leasing — Domain / Application / Infrastructure
builder.Services.AddScoped<IRentalContractRepository, RentalContractRepository>();
builder.Services.AddScoped<IRenterRepository, RenterRepository>();
builder.Services.AddScoped<CreateContractHandler>();
builder.Services.AddScoped<AddBillToContractHandler>();
builder.Services.AddScoped<ApplyReadjustmentHandler>();

// Property — Domain / Application / Infrastructure
builder.Services.AddScoped<IPropertyRepository, PropertyRepository>();
builder.Services.AddScoped<CreatePropertyHandler>();
builder.Services.AddScoped<UpdatePropertyHandler>();
builder.Services.AddScoped<UpdatePropertyStatusHandler>();
builder.Services.AddScoped<AddInspectionReportHandler>();

// Reports
builder.Services.AddScoped<AnnualReportHandler>();

// Billing — Domain / Application / Infrastructure
builder.Services.AddScoped<IInvoiceRepository, InvoiceRepository>();
builder.Services.AddScoped<CreateInvoiceHandler>();
builder.Services.AddScoped<RegisterPaymentHandler>();
builder.Services.AddScoped<AttachPixChargeHandler>();
builder.Services.AddScoped<MarkOverdueHandler>();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseExceptionHandler();
app.UseCors("AllowAll");
app.UseHttpsRedirection();
app.UseRateLimiter();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
