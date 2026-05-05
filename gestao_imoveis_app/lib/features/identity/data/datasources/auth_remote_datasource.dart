import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/network/failure_mapper.dart';
import 'package:gestao_imoveis/features/identity/data/models/login_request_model.dart';
import 'package:gestao_imoveis/features/identity/data/models/login_response_model.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._dio);

  final Dio _dio;

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.login,
        data: request.toJson(),
      );
      return LoginResponseModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<LoginResponseModel> refresh(RefreshRequestModel request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.refresh,
        data: request.toJson(),
      );
      return LoginResponseModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _dio.patch<void>(
        ApiConstants.changePassword,
        data: {'currentPassword': currentPassword, 'newPassword': newPassword},
      );
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
