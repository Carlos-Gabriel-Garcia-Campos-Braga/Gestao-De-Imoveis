import 'package:gestao_imoveis/features/identity/domain/repositories/i_auth_repository.dart';

class LogoutUseCase {
  const LogoutUseCase(this._repository);

  final IAuthRepository _repository;

  Future<void> execute() => _repository.logout();
}
