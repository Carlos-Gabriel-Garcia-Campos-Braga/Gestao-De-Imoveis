using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace GestaoImoveisAPI.Middleware
{
    public sealed class GlobalExceptionHandler : IExceptionHandler
    {
        private readonly ILogger<GlobalExceptionHandler> _logger;

        public GlobalExceptionHandler(ILogger<GlobalExceptionHandler> logger)
        {
            _logger = logger;
        }

        public async ValueTask<bool> TryHandleAsync(
            HttpContext httpContext,
            Exception exception,
            CancellationToken cancellationToken)
        {
            var (statusCode, title) = exception switch
            {
                ArgumentException => (StatusCodes.Status400BadRequest, "Requisição inválida"),
                InvalidOperationException => (StatusCodes.Status409Conflict, "Operação não permitida"),
                KeyNotFoundException => (StatusCodes.Status404NotFound, "Recurso não encontrado"),
                UnauthorizedAccessException => (StatusCodes.Status401Unauthorized, "Não autorizado"),
                _ => (StatusCodes.Status500InternalServerError, "Erro interno do servidor")
            };

            if (statusCode == StatusCodes.Status500InternalServerError)
                _logger.LogError(exception, "Exceção não tratada: {Message}", exception.Message);
            else
                _logger.LogWarning(exception, "Exceção de domínio [{Status}]: {Message}", statusCode, exception.Message);

            httpContext.Response.StatusCode = statusCode;

            await httpContext.Response.WriteAsJsonAsync(
                new ProblemDetails
                {
                    Status = statusCode,
                    Title = title,
                    Detail = exception.Message
                },
                cancellationToken);

            return true;
        }
    }
}
