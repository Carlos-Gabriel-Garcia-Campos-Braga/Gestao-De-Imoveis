import 'package:gestao_imoveis/core/secure_storage/secure_storage_service.dart';
import 'package:gestao_imoveis/features/identity/data/datasources/auth_remote_datasource.dart';
import 'package:gestao_imoveis/features/identity/data/models/login_request_model.dart';
import 'package:gestao_imoveis/features/identity/data/models/login_response_model.dart';
import 'package:gestao_imoveis/features/identity/domain/entities/app_user.dart';
import 'package:gestao_imoveis/features/identity/domain/repositories/i_auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SecureStorageService storage,
  })  : _remote = remoteDataSource,
        _storage = storage;

  final AuthRemoteDataSource _remote;
  final SecureStorageService _storage;

  @override
  Future<AppUser> login({required String email, required String password}) async {
    final response = await _remote.login(
      LoginRequestModel(email: email, password: password),
    );
    await _persistSession(response);
    return _toUser(response.user);
  }

  @override
  Future<void> logout() => _storage.clearAll();

  @override
  Future<AppUser> refreshToken() async {
    final refreshToken = await _storage.getRefreshToken();
    final userId = await _storage.getUserId();

    if (refreshToken == null || userId == null) {
      throw Exception('Sessão inválida. Faça login novamente.');
    }

    final response = await _remote.refresh(
      RefreshRequestModel(refreshToken: refreshToken, userId: userId),
    );
    await _persistSession(response);
    return _toUser(response.user);
  }

  @override
  Future<AppUser?> getStoredUser() async {
    final id = await _storage.getUserId();
    final name = await _storage.getUserName();
    final email = await _storage.getUserEmail();

    if (id == null || name == null || email == null) return null;
    return AppUser(id: id, name: name, email: email);
  }

  Future<void> _persistSession(LoginResponseModel response) async {
    await Future.wait([
      _storage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      ),
      _storage.saveUser(
        userId: response.user.id,
        name: response.user.name,
        email: response.user.email,
      ),
    ]);
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) =>
      _remote.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

  AppUser _toUser(UserOutputModel model) =>
      AppUser(id: model.id, name: model.name, email: model.email);
}
