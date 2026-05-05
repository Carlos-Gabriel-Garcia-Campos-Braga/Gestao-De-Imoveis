import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';

class RegisterPaymentUseCase {
  const RegisterPaymentUseCase(this._repository);

  final IInvoiceRepository _repository;

  Future<Invoice> execute(
    int invoiceId, {
    required double amountPaid,
    String paymentMethod = 'PIX',
  }) =>
      _repository.registerPayment(
        invoiceId,
        amountPaid: amountPaid,
        paymentMethod: paymentMethod,
      );
}
