// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contract_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRenterRequestDataImpl _$$CreateRenterRequestDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRenterRequestDataImpl(
      name: json['name'] as String,
      cpf: json['cPF'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$CreateRenterRequestDataImplToJson(
        _$CreateRenterRequestDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cPF': instance.cpf,
      'phoneNumber': instance.phoneNumber,
    };

_$CreateContractAddressDataImpl _$$CreateContractAddressDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateContractAddressDataImpl(
      street: json['street'] as String,
      number: json['number'] as String,
      complement: json['complement'] as String?,
      neighborhood: json['neighborhood'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
    );

Map<String, dynamic> _$$CreateContractAddressDataImplToJson(
        _$CreateContractAddressDataImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'complement': instance.complement,
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
    };

_$CreateContractRequestModelImpl _$$CreateContractRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateContractRequestModelImpl(
      renter: CreateRenterRequestData.fromJson(
          json['renter'] as Map<String, dynamic>),
      address: CreateContractAddressData.fromJson(
          json['adress'] as Map<String, dynamic>),
      startContract: DateTime.parse(json['startContract'] as String),
      endContract: DateTime.parse(json['endContract'] as String),
      rentalValue: (json['rentalValue'] as num).toDouble(),
      preferredIndex: json['preferredIndex'] as String? ?? 'IPCA',
    );

Map<String, dynamic> _$$CreateContractRequestModelImplToJson(
        _$CreateContractRequestModelImpl instance) =>
    <String, dynamic>{
      'renter': instance.renter,
      'adress': instance.address,
      'startContract': instance.startContract.toIso8601String(),
      'endContract': instance.endContract.toIso8601String(),
      'rentalValue': instance.rentalValue,
      'preferredIndex': instance.preferredIndex,
    };
