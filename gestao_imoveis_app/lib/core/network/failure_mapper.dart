import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';

Failure mapDioException(DioException e) => switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout =>
        const Failure.network(message: 'Tempo de conexão esgotado.'),
      DioExceptionType.connectionError => const Failure.network(),
      DioExceptionType.badResponse =>
        _mapStatusCode(e.response?.statusCode, e.response?.data),
      _ => Failure.unknown(message: e.message),
    };

Failure _mapStatusCode(int? code, Object? data) {
  final message = _extractMessage(data);
  if (code == null) return Failure.unknown(message: message);
  if (code == 401) return const Failure.unauthorized();
  if (code == 404) return Failure.notFound(message ?? 'Recurso');
  if (code == 422) return Failure.validation(message: message ?? 'Dados inválidos.');
  if (code >= 500) return Failure.server(statusCode: code, message: message);
  return Failure.unknown(message: message);
}

String? _extractMessage(Object? data) {
  if (data is Map<String, dynamic>) {
    return (data['message'] ?? data['title'] ?? data['error']) as String?;
  }
  return null;
}
