namespace SharedClasses.OutputsDTOs
{
    public class InvoiceOutputModel
    {
        public int Id { get; set; }
        public int RentalContractId { get; set; }
        public string Description { get; set; } = string.Empty;
        public string DueDate { get; set; } = string.Empty;
        public decimal Amount { get; set; }
        public string Status { get; set; } = string.Empty;
        public PixChargeOutputModel? PixCharge { get; set; }
        public LateFeeOutputModel? LateFee { get; set; }
        public PaymentRecordOutputModel? Payment { get; set; }
    }

    public class PixChargeOutputModel
    {
        public string QrCode { get; set; } = string.Empty;
        public DateTime ExpiresAt { get; set; }
        public string Status { get; set; } = string.Empty;
    }

    public class LateFeeOutputModel
    {
        public int DaysOverdue { get; set; }
        public decimal LateFeeAmount { get; set; }
        public decimal InterestAmount { get; set; }
        public decimal TotalAmount { get; set; }
    }

    public class PaymentRecordOutputModel
    {
        public DateTime PaidAt { get; set; }
        public decimal AmountPaid { get; set; }
        public string PaymentMethod { get; set; } = string.Empty;
    }
}
