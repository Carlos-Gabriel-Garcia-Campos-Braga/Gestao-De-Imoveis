import 'package:gestao_imoveis/features/identity/domain/repositories/i_auth_repository.dart';

class ChangePasswordUseCase {
  const ChangePasswordUseCase(this._repository);

  final IAuthRepository _repository;

  Future<void> execute({
    required String currentPassword,
    required String newPassword,
  }) =>
      _repository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
}
