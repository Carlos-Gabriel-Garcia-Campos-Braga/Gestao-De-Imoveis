import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_rental_contract_repository.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

class CreateContractUseCase {
  const CreateContractUseCase(this._repository);

  final IRentalContractRepository _repository;

  Future<RentalContract> execute({
    required String renterName,
    required String renterCpf,
    required String renterPhone,
    required int propertyId,
    required DateTime startContract,
    required DateTime endContract,
    required double rentalValue,
    required EconomicIndex preferredIndex,
  }) =>
      _repository.create(
        renterName: renterName,
        renterCpf: renterCpf,
        renterPhone: renterPhone,
        propertyId: propertyId,
        startContract: startContract,
        endContract: endContract,
        rentalValue: rentalValue,
        preferredIndex: preferredIndex,
      );
}
