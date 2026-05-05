using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class ApplyReadjustmentInputModel
    {
        /// <summary>
        /// Índice econômico: IPCA, INPC ou IGPM.
        /// Quando omitido, usa o índice configurado no contrato.
        /// </summary>
        public string? Index { get; set; }

        /// <summary>
        /// Taxa manual em % (ex: 4.87 = 4,87%).
        /// Obrigatório para IGPM (FGV — sem API pública).
        /// Quando informado, substitui a consulta automática ao IBGE.
        /// </summary>
        [Range(0, 100, ErrorMessage = "Taxa deve estar entre 0% e 100%.")]
        public decimal? ManualRate { get; set; }
    }
}
