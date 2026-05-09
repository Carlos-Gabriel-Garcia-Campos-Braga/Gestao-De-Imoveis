import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';

abstract interface class IRenterRepository {
  Future<List<Renter>> getAll();

  Future<Renter> getById(int id);

  Future<bool> verifyCpf(String cpf);

  Future<Renter> create({
    required String name,
    required String cpf,
    required String phoneNumber,
  });

  Future<List<Renter>> getArchived();

  Future<Renter> archive(int id);

  Future<Renter> unarchive(int id);
}
