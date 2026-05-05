enum InvoiceStatus { pending, overdue, paid, cancelled }

extension InvoiceStatusLabel on InvoiceStatus {
  String get label => switch (this) {
        InvoiceStatus.pending => 'Pendente',
        InvoiceStatus.overdue => 'Vencido',
        InvoiceStatus.paid => 'Pago',
        InvoiceStatus.cancelled => 'Cancelado',
      };

  String get toApiString => switch (this) {
        InvoiceStatus.pending => 'Pending',
        InvoiceStatus.overdue => 'Overdue',
        InvoiceStatus.paid => 'Paid',
        InvoiceStatus.cancelled => 'Cancelled',
      };

  static InvoiceStatus fromApi(String v) => switch (v.toLowerCase()) {
        'overdue' => InvoiceStatus.overdue,
        'paid' => InvoiceStatus.paid,
        'cancelled' => InvoiceStatus.cancelled,
        _ => InvoiceStatus.pending,
      };
}
