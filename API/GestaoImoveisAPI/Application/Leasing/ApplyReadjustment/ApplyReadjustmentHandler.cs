using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using GestaoImoveisAPI.Domain.Leasing.Services;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Leasing.ApplyReadjustment
{
    public class ApplyReadjustmentHandler
    {
        private readonly IRentalContractRepository _repository;
        private readonly IIbgeIndexService _ibgeService;

        public ApplyReadjustmentHandler(
            IRentalContractRepository repository,
            IIbgeIndexService ibgeService)
        {
            _repository = repository;
            _ibgeService = ibgeService;
        }

        public async Task<ReadjustmentOutputModel> HandleAsync(
            int contractId,
            ApplyReadjustmentInputModel input,
            CancellationToken ct = default)
        {
            var contract = await _repository.GetByIdWithReadjustmentsAsync(contractId, ct)
                ?? throw new KeyNotFoundException($"Contrato {contractId} não encontrado.");

            // Resolve o índice: usa o do input ou o preferido do contrato
            var index = ResolveIndex(input.Index, contract.PreferredIndex);

            decimal rate;

            if (input.ManualRate.HasValue)
            {
                rate = input.ManualRate.Value;
            }
            else
            {
                var referenceMonth = DateOnly.FromDateTime(DateTime.UtcNow).AddMonths(-1);
                var ibgeRate = await _ibgeService.GetTwelveMonthAccumulatedRateAsync(index, referenceMonth, ct);

                if (ibgeRate == null)
                {
                    var hint = index == EconomicIndex.IGPM
                        ? "IGPM é calculado pela FGV e não está disponível via API. "
                        : "A API do IBGE está indisponível no momento. ";

                    throw new InvalidOperationException(
                        hint + "Informe a taxa manualmente via campo 'manualRate'.");
                }

                rate = ibgeRate.Value;
            }

            var record = contract.ApplyAnnualReadjustment(index, rate);
            await _repository.SaveChangesAsync(ct);

            return ToOutput(record);
        }

        private static EconomicIndex ResolveIndex(string? inputIndex, EconomicIndex contractDefault)
        {
            if (string.IsNullOrWhiteSpace(inputIndex))
                return contractDefault;

            if (!Enum.TryParse<EconomicIndex>(inputIndex, ignoreCase: true, out var parsed))
                throw new ArgumentException(
                    $"Índice inválido: '{inputIndex}'. Valores aceitos: {string.Join(", ", Enum.GetNames<EconomicIndex>())}");

            return parsed;
        }

        public static ReadjustmentOutputModel ToOutput(ReadjustmentRecord r) =>
            new()
            {
                ContractId = r.ContractId,
                Index = r.Index.ToString(),
                Rate = r.Rate,
                OldValue = r.OldValue,
                NewValue = r.NewValue,
                AppliedAt = r.AppliedAt
            };
    }
}
