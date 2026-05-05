import 'package:gestao_imoveis/features/leasing/data/datasources/leasing_remote_datasource.dart';
import 'package:gestao_imoveis/features/leasing/data/models/create_renter_request_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/renter_model.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_renter_repository.dart';

class RenterRepositoryImpl implements IRenterRepository {
  const RenterRepositoryImpl(this._dataSource);

  final LeasingRemoteDataSource _dataSource;

  @override
  Future<List<Renter>> getAll() async {
    final models = await _dataSource.getRenters();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Renter> getById(int id) async {
    final model = await _dataSource.getRenterById(id);
    return model.toEntity();
  }

  @override
  Future<bool> verifyCpf(String cpf) => _dataSource.verifyCpf(cpf);

  @override
  Future<Renter> create({
    required String name,
    required String cpf,
    required String phoneNumber,
  }) async {
    final model = await _dataSource.createRenter(
      CreateRenterRequestModel(name: name, cpf: cpf, phoneNumber: phoneNumber),
    );
    return model.toEntity();
  }
}
