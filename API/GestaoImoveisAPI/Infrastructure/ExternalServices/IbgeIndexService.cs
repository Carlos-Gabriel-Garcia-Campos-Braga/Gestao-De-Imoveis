using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Services;
using System.Globalization;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GestaoImoveisAPI.Infrastructure.ExternalServices
{
    public class IbgeIndexService : IIbgeIndexService
    {
        private readonly HttpClient _httpClient;
        private readonly ILogger<IbgeIndexService> _logger;

        // aggregate → (variable) mapeamento da API IBGE SIDRA v3
        private static readonly Dictionary<EconomicIndex, (int Aggregate, int Variable)> IndexConfig = new()
        {
            [EconomicIndex.IPCA] = (1737, 63),
            [EconomicIndex.INPC] = (1736, 44)
        };

        public IbgeIndexService(HttpClient httpClient, ILogger<IbgeIndexService> logger)
        {
            _httpClient = httpClient;
            _logger = logger;
        }

        public async Task<decimal?> GetTwelveMonthAccumulatedRateAsync(
            EconomicIndex index,
            DateOnly referenceMonth,
            CancellationToken ct = default)
        {
            if (index == EconomicIndex.IGPM)
            {
                _logger.LogInformation("IGPM é da FGV e não está disponível via IBGE. Use a taxa manual.");
                return null;
            }

            if (!IndexConfig.TryGetValue(index, out var config))
                return null;

            var end = new DateOnly(referenceMonth.Year, referenceMonth.Month, 1);
            var start = end.AddMonths(-11);

            var startStr = $"{start.Year}{start.Month:D2}";
            var endStr = $"{end.Year}{end.Month:D2}";

            var url = $"agregados/{config.Aggregate}/periodos/{startStr}-{endStr}/variaveis/{config.Variable}?localidades=N1[all]";

            try
            {
                var response = await _httpClient.GetAsync(url, ct);

                if (!response.IsSuccessStatusCode)
                {
                    _logger.LogWarning("IBGE retornou {Status} para {Index}", response.StatusCode, index);
                    return null;
                }

                var json = await response.Content.ReadAsStringAsync(ct);
                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
                var results = JsonSerializer.Deserialize<List<IbgeVariableResult>>(json, options);

                var serie = results?
                    .FirstOrDefault()?.Resultados?
                    .FirstOrDefault()?.Series?
                    .FirstOrDefault(s => s.Localidade?.Id == "1")?.Serie;

                if (serie == null || serie.Count < 12)
                {
                    _logger.LogWarning("IBGE: dados insuficientes para {Index} ({Count} meses)", index, serie?.Count ?? 0);
                    return null;
                }

                // Compõe as taxas mensais: (1+r1)×(1+r2)×…×(1+r12) − 1
                var accumulated = serie.Values
                    .Select(v => decimal.TryParse(v, NumberStyles.Any, CultureInfo.InvariantCulture, out var r) ? r : 0m)
                    .Aggregate(1m, (acc, r) => acc * (1 + r / 100));

                return Math.Round((accumulated - 1) * 100, 4);
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, "Falha ao consultar IBGE para índice {Index}", index);
                return null;
            }
        }

        // --- modelos internos de desserialização ---

        private sealed class IbgeVariableResult
        {
            public List<IbgeResultado>? Resultados { get; set; }
        }

        private sealed class IbgeResultado
        {
            public List<IbgeSerie>? Series { get; set; }
        }

        private sealed class IbgeSerie
        {
            public IbgeLocalidade? Localidade { get; set; }
            public Dictionary<string, string>? Serie { get; set; }
        }

        private sealed class IbgeLocalidade
        {
            public string? Id { get; set; }
        }
    }
}
