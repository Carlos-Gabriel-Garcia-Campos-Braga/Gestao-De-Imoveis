import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';

class GetInvoicesUseCase {
  const GetInvoicesUseCase(this._repository);

  final IInvoiceRepository _repository;

  Future<List<Invoice>> execute() => _repository.getAll();
}
