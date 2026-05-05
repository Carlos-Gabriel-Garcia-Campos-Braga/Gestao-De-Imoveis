import 'package:gestao_imoveis/features/billing/data/datasources/billing_remote_datasource.dart';
import 'package:gestao_imoveis/features/billing/data/models/create_invoice_request_model.dart';
import 'package:gestao_imoveis/features/billing/data/models/invoice_model.dart';
import 'package:gestao_imoveis/features/billing/data/models/register_payment_request_model.dart';
import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';

class InvoiceRepositoryImpl implements IInvoiceRepository {
  const InvoiceRepositoryImpl(this._dataSource);

  final BillingRemoteDataSource _dataSource;

  @override
  Future<List<Invoice>> getAll() async {
    final models = await _dataSource.getAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Invoice> getById(int id) async {
    final model = await _dataSource.getById(id);
    return model.toEntity();
  }

  @override
  Future<List<Invoice>> getByContract(int contractId) async {
    final models = await _dataSource.getByContract(contractId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Invoice>> getOverdue() async {
    final models = await _dataSource.getOverdue();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Invoice>> getDueSoon({int daysAhead = 5}) async {
    final models = await _dataSource.getDueSoon(daysAhead: daysAhead);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Invoice> create({
    required int rentalContractId,
    required String description,
    required DateTime dueDate,
    required double amount,
  }) async {
    final model = await _dataSource.create(
      CreateInvoiceRequestModel(
        rentalContractId: rentalContractId,
        description: description,
        dueDate: '${dueDate.year.toString().padLeft(4, '0')}-'
            '${dueDate.month.toString().padLeft(2, '0')}-'
            '${dueDate.day.toString().padLeft(2, '0')}',
        amount: amount,
      ),
    );
    return model.toEntity();
  }

  @override
  Future<Invoice> registerPayment(
    int id, {
    required double amountPaid,
    String paymentMethod = 'PIX',
  }) async {
    final model = await _dataSource.registerPayment(
      id,
      RegisterPaymentRequestModel(
          amountPaid: amountPaid, paymentMethod: paymentMethod),
    );
    return model.toEntity();
  }

  @override
  Future<Invoice> generatePix(int id) async {
    final model = await _dataSource.generatePix(id);
    return model.toEntity();
  }

  @override
  Future<Invoice> markOverdue(int id) async {
    final model = await _dataSource.markOverdue(id);
    return model.toEntity();
  }
}
