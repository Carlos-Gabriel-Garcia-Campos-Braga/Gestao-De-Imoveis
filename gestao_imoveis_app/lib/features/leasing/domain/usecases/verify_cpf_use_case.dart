import 'package:gestao_imoveis/features/leasing/domain/repositories/i_renter_repository.dart';

class VerifyCpfUseCase {
  const VerifyCpfUseCase(this._repository);

  final IRenterRepository _repository;

  Future<bool> execute(String cpf) => _repository.verifyCpf(cpf);
}
