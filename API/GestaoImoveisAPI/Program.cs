using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Services;
using Microsoft.EntityFrameworkCore;
using GestaoImoveisAPI.Validators;

var builder = WebApplication.CreateBuilder(args);

//O EF sera configurado para usar o MySQL
var cs = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<AppDbContext>(opts => //Essa parte injeta o AppDbContext e informa a conexao que sera feita
                                                 opts.UseMySql(cs, ServerVersion.AutoDetect(cs)));

//Colocar os controllers e swagger
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
    options.JsonSerializerOptions.WriteIndented = true; //deixar o JSON mais legivel
});
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
//builder.WebHost.UseUrls($"http://*:{Environment.GetEnvironmentVariable("PORT") ?? "5000"}");

//Configuracao do CORS (isso faz o app MAUI conversar com a API)
builder.Services.AddCors(o => o.AddPolicy("AllowAll", p => //Libera o acesso ao MAUI
                                                        p.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()));

//Registro do AddressService para uso do ViaCEP
builder.Services.AddHttpClient<AddressService>();
builder.Services.AddScoped<RentalContractValidator>();


var app = builder.Build();

if(app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("AllowAll");
app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.Run();