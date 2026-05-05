import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_type.dart';

part 'property_model.freezed.dart';
part 'property_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String street,
    String? complement,
    String? number,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
class PropertyModel with _$PropertyModel {
  const factory PropertyModel({
    required int id,
    required String description,
    required String type,
    required String status,
    required AddressModel address,
  }) = _PropertyModel;

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);
}

extension PropertyModelToEntity on PropertyModel {
  Property toEntity() => Property(
        id: id,
        description: description,
        type: PropertyTypeLabel.fromApi(type),
        status: PropertyStatusLabel.fromApi(status),
        street: address.street,
        number: address.number,
        complement: address.complement,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
        zipCode: address.zipCode,
      );
}
