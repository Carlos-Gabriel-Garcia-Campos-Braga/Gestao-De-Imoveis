import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';

part 'renter_model.freezed.dart';
part 'renter_model.g.dart';

@freezed
class RenterModel with _$RenterModel {
  const factory RenterModel({
    required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'cPF') required String cpf,
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
  }) = _RenterModel;

  factory RenterModel.fromJson(Map<String, dynamic> json) =>
      _$RenterModelFromJson(json);
}

extension RenterModelToEntity on RenterModel {
  Renter toEntity() => Renter(
        id: id,
        name: name,
        cpf: cpf,
        phoneNumber: phoneNumber,
      );
}
