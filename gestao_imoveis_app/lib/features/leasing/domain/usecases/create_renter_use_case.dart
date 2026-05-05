import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_renter_repository.dart';

class CreateRenterUseCase {
  const CreateRenterUseCase(this._repository);

  final IRenterRepository _repository;

  Future<Renter> execute({
    required String name,
    required String cpf,
    required String phoneNumber,
  }) =>
      _repository.create(name: name, cpf: cpf, phoneNumber: phoneNumber);
}
