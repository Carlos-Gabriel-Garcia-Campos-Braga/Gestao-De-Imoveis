import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';

class GetInvoiceDetailUseCase {
  const GetInvoiceDetailUseCase(this._repository);

  final IInvoiceRepository _repository;

  Future<Invoice> execute(int id) => _repository.getById(id);
}
