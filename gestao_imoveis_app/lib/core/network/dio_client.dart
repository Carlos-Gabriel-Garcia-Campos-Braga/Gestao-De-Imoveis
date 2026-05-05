import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/network/auth_interceptor.dart';
import 'package:gestao_imoveis/core/secure_storage/secure_storage_service.dart';

class DioClient {
  DioClient._();

  static Dio create({
    required String baseUrl,
    required SecureStorageService storage,
    required void Function() onUnauthorized,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(
        storage: storage,
        dio: dio,
        baseUrl: baseUrl,
        onUnauthorized: onUnauthorized,
      ),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => _log(obj.toString()),
      ),
    ]);

    return dio;
  }

  static void _log(String message) {
    // ignore: avoid_print
    assert(() {
      // ignore: avoid_print
      print('[DioClient] $message');
      return true;
    }());
  }
}
