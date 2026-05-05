import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_renter_repository.dart';

class GetRenterDetailUseCase {
  const GetRenterDetailUseCase(this._repository);

  final IRenterRepository _repository;

  Future<Renter> execute(int id) => _repository.getById(id);
}
