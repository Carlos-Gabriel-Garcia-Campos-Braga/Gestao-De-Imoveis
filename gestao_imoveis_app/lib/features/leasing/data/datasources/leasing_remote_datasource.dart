import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/network/failure_mapper.dart';
import 'package:gestao_imoveis/features/leasing/data/models/apply_readjustment_request_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/create_renter_request_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/readjustment_record_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/rental_contract_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/renter_model.dart';

class LeasingRemoteDataSource {
  const LeasingRemoteDataSource(this._dio);

  final Dio _dio;

  // ── Contracts ──────────────────────────────────────────────────────────────

  Future<List<RentalContractModel>> getContracts() async {
    try {
      final response =
          await _dio.get<List<dynamic>>(ApiConstants.contracts);
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(RentalContractModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<RentalContractModel> createContract(
      Map<String, dynamic> body) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.contracts,
        data: body,
      );
      return RentalContractModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<ReadjustmentRecordModel> applyReadjustment(
    int id,
    ApplyReadjustmentRequestModel req,
  ) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiConstants.applyReadjustment(id),
        data: req.toJson(),
      );
      return ReadjustmentRecordModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  // ── Renters ────────────────────────────────────────────────────────────────

  Future<List<RenterModel>> getRenters() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiConstants.renters);
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(RenterModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<RenterModel> getRenterById(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.renterById(id),
      );
      return RenterModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<bool> verifyCpf(String cpf) async {
    try {
      final response = await _dio.get<bool>(ApiConstants.verifyCpf(cpf));
      return response.data ?? false;
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<RenterModel> createRenter(CreateRenterRequestModel req) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.renters,
        data: req.toJson(),
      );
      return RenterModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
