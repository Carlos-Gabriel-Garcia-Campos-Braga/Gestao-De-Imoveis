import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/network/failure_mapper.dart';
import 'package:gestao_imoveis/features/billing/data/models/create_invoice_request_model.dart';
import 'package:gestao_imoveis/features/billing/data/models/invoice_model.dart';
import 'package:gestao_imoveis/features/billing/data/models/register_payment_request_model.dart';

class BillingRemoteDataSource {
  const BillingRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<InvoiceModel>> getAll() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiConstants.invoices);
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(InvoiceModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<InvoiceModel> getById(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.invoiceById(id),
      );
      return InvoiceModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<InvoiceModel>> getByContract(int contractId) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiConstants.invoicesByContract(contractId),
      );
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(InvoiceModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<InvoiceModel>> getOverdue() async {
    try {
      final response =
          await _dio.get<List<dynamic>>(ApiConstants.overdueInvoices);
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(InvoiceModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<InvoiceModel>> getDueSoon({int daysAhead = 5}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiConstants.dueSoonInvoices,
        queryParameters: {'daysAhead': daysAhead},
      );
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(InvoiceModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<InvoiceModel> create(CreateInvoiceRequestModel req) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.invoices,
        data: req.toJson(),
      );
      return InvoiceModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<InvoiceModel> registerPayment(
    int id,
    RegisterPaymentRequestModel req,
  ) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiConstants.registerPayment(id),
        data: req.toJson(),
      );
      return InvoiceModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<InvoiceModel> generatePix(int id) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.generatePix(id),
      );
      return InvoiceModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<InvoiceModel> markOverdue(int id) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiConstants.markOverdue(id),
      );
      return InvoiceModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
