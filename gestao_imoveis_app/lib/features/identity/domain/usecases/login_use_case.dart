import 'package:gestao_imoveis/core/errors/domain_exception.dart';
import 'package:gestao_imoveis/features/identity/domain/entities/app_user.dart';
import 'package:gestao_imoveis/features/identity/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  const LoginUseCase(this._repository);

  final IAuthRepository _repository;

  Future<AppUser> execute({required String email, required String password}) {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();

    if (trimmedEmail.isEmpty) throw const DomainException('E-mail é obrigatório.');
    if (trimmedPassword.isEmpty) throw const DomainException('Senha é obrigatória.');
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(trimmedEmail)) {
      throw const DomainException('E-mail inválido.');
    }

    return _repository.login(email: trimmedEmail, password: trimmedPassword);
  }
}
