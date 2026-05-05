import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

abstract interface class IRentalContractRepository {
  Future<List<RentalContract>> getAll();

  Future<RentalContract> create({
    required String renterName,
    required String renterCpf,
    required String renterPhone,
    required String street,
    required String number,
    String? complement,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
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
}
