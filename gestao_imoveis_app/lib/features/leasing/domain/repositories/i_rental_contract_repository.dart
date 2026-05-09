import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

abstract interface class IRentalContractRepository {
  Future<List<RentalContract>> getAll();

  Future<RentalContract> create({
    required String renterName,
    required String renterCpf,
    required String renterPhone,
    required int propertyId,
    required DateTime startContract,
    required DateTime endContract,
    required double rentalValue,
    required EconomicIndex preferredIndex,
  });

  Future<ReadjustmentRecord> applyReadjustment(
    int id, {
    EconomicIndex? index,
    double? manualRate,
  });

  Future<List<RentalContract>> getArchived();

  Future<RentalContract> archive(int id);

  Future<RentalContract> unarchive(int id);

  Future<RentalContract> terminate(int id, String terminatedBy);
}
