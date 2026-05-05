namespace GestaoImoveisAPI.Domain.Leasing.Services
{
    public interface IIbgeIndexService
    {
        /// <summary>
        /// Retorna a taxa acumulada em 12 meses (%) para o índice informado.
        /// Retorna null quando o índice não está disponível via API (IGPM)
        /// ou quando a API está fora do ar — use a taxa manual nesses casos.
        /// </summary>
        Task<decimal?> GetTwelveMonthAccumulatedRateAsync(
            EconomicIndex index,
            DateOnly referenceMonth,
            CancellationToken ct = default);
    }
}
