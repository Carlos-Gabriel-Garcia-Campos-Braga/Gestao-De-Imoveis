import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/network/auth_loss_event.dart';
import 'package:gestao_imoveis/core/network/dio_provider.dart';
import 'package:gestao_imoveis/core/secure_storage/secure_storage_provider.dart';
import 'package:gestao_imoveis/features/identity/data/datasources/auth_remote_datasource.dart';
import 'package:gestao_imoveis/features/identity/data/repositories/auth_repository_impl.dart';
import 'package:gestao_imoveis/features/identity/domain/entities/app_user.dart';
import 'package:gestao_imoveis/features/identity/domain/repositories/i_auth_repository.dart';
import 'package:gestao_imoveis/features/identity/domain/usecases/login_use_case.dart';
import 'package:gestao_imoveis/features/identity/domain/usecases/logout_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

// ── Infraestrutura ──────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
IAuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    storage: ref.watch(secureStorageProvider),
  );
}

@Riverpod(keepAlive: true)
LoginUseCase loginUseCase(Ref ref) =>
    LoginUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
LogoutUseCase logoutUseCase(Ref ref) =>
    LogoutUseCase(ref.watch(authRepositoryProvider));

// ── Auth State ───────────────────────────────────────────────────────────────

/// Usuário autenticado ou null se não autenticado
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AppUser?> build() async {
    ref.listen<int>(authLossEventProvider, (_, count) async {
      if (count > 0) {
        await ref.read(logoutUseCaseProvider).execute();
        state = const AsyncData(null);
      }
    });
    return ref.watch(authRepositoryProvider).getStoredUser();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(loginUseCaseProvider).execute(email: email, password: password),
    );
  }

  Future<void> logout() async {
    await ref.read(logoutUseCaseProvider).execute();
    state = const AsyncData(null);
  }
}

// Derivado conveniente — true se autenticado
@riverpod
bool isAuthenticated(Ref ref) {
  return ref.watch(authNotifierProvider).valueOrNull != null;
}

// Usuário atual (sem nullable boilerplate nos widgets)
@riverpod
AppUser? currentUser(Ref ref) {
  return ref.watch(authNotifierProvider).valueOrNull;
}
