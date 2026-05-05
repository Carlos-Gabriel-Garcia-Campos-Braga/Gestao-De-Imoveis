// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractAddressModelImpl _$$ContractAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractAddressModelImpl(
      street: (json['street'] as String?) ?? '',
      complement: json['complement'] as String?,
      number: (json['number'] as String?) ?? '',
      neighborhood: (json['neighborhood'] as String?) ?? '',
      city: (json['city'] as String?) ?? '',
      state: (json['state'] as String?) ?? '',
      zipCode: (json['zipCode'] as String?) ?? '',
    );

Map<String, dynamic> _$$ContractAddressModelImplToJson(
        _$ContractAddressModelImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'complement': instance.complement,
      'number': instance.number,
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
    };

_$RentalContractModelImpl _$$RentalContractModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalContractModelImpl(
      id: (json['id'] as num).toInt(),
      renter: RenterModel.fromJson(json['renter'] as Map<String, dynamic>),
      address:
          ContractAddressModel.fromJson(json['adress'] as Map<String, dynamic>),
      bills: (json['bills'] as List<dynamic>)
          .map((e) => RentBillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      startContract: DateTime.parse((json['startContract'] as String?) ?? DateTime.now().toIso8601String()),
      endContract: DateTime.parse((json['endContract'] as String?) ?? DateTime.now().toIso8601String()),
      rentalValue: (json['rentalValue'] as num).toDouble(),
      preferredIndex: (json['preferredIndex'] as String?) ?? 'IPCA',
      readjustmentHistory: (json['readjustmentHistory'] as List<dynamic>)
          .map((e) =>
              ReadjustmentRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RentalContractModelImplToJson(
        _$RentalContractModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'renter': instance.renter,
      'adress': instance.address,
      'bills': instance.bills,
      'startContract': instance.startContract.toIso8601String(),
      'endContract': instance.endContract.toIso8601String(),
      'rentalValue': instance.rentalValue,
      'preferredIndex': instance.preferredIndex,
      'readjustmentHistory': instance.readjustmentHistory,
    };
