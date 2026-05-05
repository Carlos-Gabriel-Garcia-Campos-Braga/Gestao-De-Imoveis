import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_contract_request_model.freezed.dart';
part 'create_contract_request_model.g.dart';

@freezed
class CreateRenterRequestData with _$CreateRenterRequestData {
  const factory CreateRenterRequestData({
    required String name,
    @JsonKey(name: 'cPF') required String cpf,
    required String phoneNumber,
  }) = _CreateRenterRequestData;

  factory CreateRenterRequestData.fromJson(Map<String, dynamic> json) =>
      _$CreateRenterRequestDataFromJson(json);
}

@freezed
class CreateContractAddressData with _$CreateContractAddressData {
  const factory CreateContractAddressData({
    required String street,
    required String number,
    String? complement,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
  }) = _CreateContractAddressData;

  factory CreateContractAddressData.fromJson(Map<String, dynamic> json) =>
      _$CreateContractAddressDataFromJson(json);
}

@freezed
class CreateContractRequestModel with _$CreateContractRequestModel {
  const factory CreateContractRequestModel({
    required CreateRenterRequestData renter,
    @JsonKey(name: 'adress') required CreateContractAddressData address,
    required DateTime startContract,
    required DateTime endContract,
    required double rentalValue,
    @Default('IPCA') String preferredIndex,
  }) = _CreateContractRequestModel;

  factory CreateContractRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateContractRequestModelFromJson(json);
}
