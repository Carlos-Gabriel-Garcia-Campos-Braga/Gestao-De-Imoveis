import 'package:gestao_imoveis/features/leasing/data/datasources/leasing_remote_datasource.dart';
import 'package:gestao_imoveis/features/leasing/data/models/apply_readjustment_request_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/readjustment_record_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/rental_contract_model.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_rental_contract_repository.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

class RentalContractRepositoryImpl implements IRentalContractRepository {
  const RentalContractRepositoryImpl(this._dataSource);

  final LeasingRemoteDataSource _dataSource;

  @override
  Future<List<RentalContract>> getAll() async {
    final models = await _dataSource.getContracts();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
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
  }) async {
    final body = <String, dynamic>{
      'renter': {
        'name': renterName,
        'cPF': renterCpf,
        'phoneNumber': renterPhone,
      },
      'adress': {
        'street': street,
        'number': number,
        if (complement != null && complement.isNotEmpty) 'complement': complement,
        'neighborhood': neighborhood,
        'city': city,
        'state': state,
        'zipCode': zipCode,
      },
      'bills': <dynamic>[],
      'startContract': startContract.toIso8601String(),
      'endContract': endContract.toIso8601String(),
      'rentalValue': rentalValue,
      'preferredIndex': preferredIndex.toApiString,
    };
    final model = await _dataSource.createContract(body);
    return model.toEntity();
  }

  @override
  Future<ReadjustmentRecord> applyReadjustment(
    int id, {
    EconomicIndex? index,
    double? manualRate,
  }) async {
    final model = await _dataSource.applyReadjustment(
      id,
      ApplyReadjustmentRequestModel(
        index: index?.toApiString,
        manualRate: manualRate,
      ),
    );
    return model.toEntity();
  }
}
