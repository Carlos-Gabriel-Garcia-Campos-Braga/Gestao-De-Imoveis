import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/leasing/data/models/readjustment_record_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/rent_bill_model.dart';
import 'package:gestao_imoveis/features/leasing/data/models/renter_model.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

part 'rental_contract_model.freezed.dart';
part 'rental_contract_model.g.dart';

@freezed
class ContractAddressModel with _$ContractAddressModel {
  const factory ContractAddressModel({
    required String street,
    String? complement,
    required String number,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
  }) = _ContractAddressModel;

  factory ContractAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ContractAddressModelFromJson(json);
}

@freezed
class RentalContractModel with _$RentalContractModel {
  const factory RentalContractModel({
    required int id,
    required RenterModel renter,
    @JsonKey(name: 'adress') required ContractAddressModel address,
    required List<RentBillModel> bills,
    required DateTime startContract,
    required DateTime endContract,
    required double rentalValue,
    required String preferredIndex,
    required List<ReadjustmentRecordModel> readjustmentHistory,
    DateTime? terminatedAt,
    String? terminatedBy,
  }) = _RentalContractModel;

  factory RentalContractModel.fromJson(Map<String, dynamic> json) =>
      _$RentalContractModelFromJson(json);
}

extension RentalContractModelToEntity on RentalContractModel {
  RentalContract toEntity() => RentalContract(
        id: id,
        renter: renter.toEntity(),
        street: address.street,
        number: address.number,
        complement: address.complement,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
        zipCode: address.zipCode,
        bills: bills.map((b) => b.toEntity()).toList(),
        startContract: startContract,
        endContract: endContract,
        rentalValue: rentalValue,
        preferredIndex: EconomicIndexLabel.fromApi(preferredIndex),
        readjustmentHistory:
            readjustmentHistory.map((r) => r.toEntity()).toList(),
        terminatedAt: terminatedAt,
        terminatedBy: terminatedBy,
      );
}
