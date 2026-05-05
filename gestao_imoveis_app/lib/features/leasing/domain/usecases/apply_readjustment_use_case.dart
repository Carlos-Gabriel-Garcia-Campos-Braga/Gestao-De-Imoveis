import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_rental_contract_repository.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

class ApplyReadjustmentUseCase {
  const ApplyReadjustmentUseCase(this._repository);

  final IRentalContractRepository _repository;

  Future<ReadjustmentRecord> execute(
    int contractId, {
    EconomicIndex? index,
    double? manualRate,
  }) =>
      _repository.applyReadjustment(
        contractId,
        index: index,
        manualRate: manualRate,
      );
}
