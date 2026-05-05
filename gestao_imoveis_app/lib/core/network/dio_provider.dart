import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/network/auth_loss_event.dart';
import 'package:gestao_imoveis/core/network/dio_client.dart';
import 'package:gestao_imoveis/core/secure_storage/secure_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return DioClient.create(
    baseUrl: ApiConstants.baseUrl,
    storage: ref.watch(secureStorageProvider),
    onUnauthorized: () => ref.read(authLossEventProvider.notifier).dispatch(),
  );
}
