import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/secure_storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.storage,
    required this.dio,
    required this.baseUrl,
    required this.onUnauthorized,
  });

  final SecureStorageService storage;
  final Dio dio;
  final String baseUrl;
  final void Function() onUnauthorized;

  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})> _queue = [];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final is401 = err.response?.statusCode == 401;
    final isRefreshPath = err.requestOptions.path.contains('/user/refresh');

    if (!is401 || isRefreshPath) {
      return handler.next(err);
    }

    if (_isRefreshing) {
      _queue.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;
    try {
      final refreshToken = await storage.getRefreshToken();
      final userId = await storage.getUserId();

      if (refreshToken == null || userId == null) {
        _rejectAll(err);
        onUnauthorized();
        return handler.reject(err);
      }

      final response = await dio.post<Map<String, dynamic>>(
        '$baseUrl/api/user/refresh',
        data: {
          'refreshToken': refreshToken,
          'userId': userId,
        },
      );

      final data = response.data;
      if (data == null) {
        _rejectAll(err);
        onUnauthorized();
        return handler.reject(err);
      }

      final newAccess = data['accessToken'] as String;
      final newRefresh = data['refreshToken'] as String;

      await storage.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );

      final queued = List.of(_queue);
      _queue.clear();
      for (final item in queued) {
        item.options.headers['Authorization'] = 'Bearer $newAccess';
        try {
          final r = await dio.fetch<Object?>(item.options);
          item.handler.resolve(r);
        } on DioException catch (e) {
          item.handler.reject(e);
        }
      }

      err.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
      final retryResponse = await dio.fetch<Object?>(err.requestOptions);
      handler.resolve(retryResponse);
    } on DioException {
      _rejectAll(err);
      onUnauthorized();
      handler.reject(err);
    } finally {
      _isRefreshing = false;
    }
  }

  void _rejectAll(DioException err) {
    final queued = List.of(_queue);
    _queue.clear();
    for (final item in queued) {
      item.handler.reject(err);
    }
  }
}
