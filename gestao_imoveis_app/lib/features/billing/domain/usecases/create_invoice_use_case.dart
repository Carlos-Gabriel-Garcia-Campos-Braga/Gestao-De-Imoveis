import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';

class CreateInvoiceUseCase {
  const CreateInvoiceUseCase(this._repository);

  final IInvoiceRepository _repository;

  Future<Invoice> execute({
    required int rentalContractId,
    required String description,
    required DateTime dueDate,
    required double amount,
  }) =>
      _repository.create(
        rentalContractId: rentalContractId,
        description: description,
        dueDate: dueDate,
        amount: amount,
      );
}
