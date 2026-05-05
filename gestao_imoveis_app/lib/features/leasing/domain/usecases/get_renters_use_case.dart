import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_renter_repository.dart';

class GetRentersUseCase {
  const GetRentersUseCase(this._repository);

  final IRenterRepository _repository;

  Future<List<Renter>> execute() => _repository.getAll();
}
