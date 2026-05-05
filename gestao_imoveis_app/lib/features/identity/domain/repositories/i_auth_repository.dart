import 'package:gestao_imoveis/features/identity/domain/entities/app_user.dart';

abstract interface class IAuthRepository {
  Future<AppUser> login({required String email, required String password});
  Future<void> logout();
  Future<AppUser> refreshToken();
  Future<AppUser?> getStoredUser();
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
