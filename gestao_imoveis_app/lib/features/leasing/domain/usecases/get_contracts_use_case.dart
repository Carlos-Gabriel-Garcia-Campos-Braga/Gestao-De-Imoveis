import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_rental_contract_repository.dart';

class GetContractsUseCase {
  const GetContractsUseCase(this._repository);

  final IRentalContractRepository _repository;

  Future<List<RentalContract>> execute() => _repository.getAll();
}
