import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';

abstract interface class IInvoiceRepository {
  Future<List<Invoice>> getAll();

  Future<Invoice> getById(int id);

  Future<List<Invoice>> getByContract(int contractId);

  Future<List<Invoice>> getOverdue();

  Future<List<Invoice>> getDueSoon({int daysAhead = 5});

  Future<Invoice> create({
    required int rentalContractId,
    required String description,
    required DateTime dueDate,
    required double amount,
  });

  Future<Invoice> registerPayment(
    int id, {
    required double amountPaid,
    String paymentMethod = 'PIX',
  });

  Future<Invoice> generatePix(int id);

  Future<Invoice> markOverdue(int id);
}
