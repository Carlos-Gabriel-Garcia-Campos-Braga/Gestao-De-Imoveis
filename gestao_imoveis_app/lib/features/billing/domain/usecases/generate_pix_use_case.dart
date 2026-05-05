import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';

class GeneratePixUseCase {
  const GeneratePixUseCase(this._repository);

  final IInvoiceRepository _repository;

  Future<Invoice> execute(int invoiceId) => _repository.generatePix(invoiceId);
}
