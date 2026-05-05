import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_type.dart';

part 'property.freezed.dart';

@freezed
class Property with _$Property {
  const factory Property({
    required int id,
    required String description,
    required PropertyType type,
    required PropertyStatus status,
    required String street,
    String? number,
    String? complement,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
  }) = _Property;

  const Property._();
}

extension PropertyAddress on Property {
  String get fullAddress =>
      '$street${number != null ? ', $number' : ' S/N'}${complement != null ? ', $complement' : ''} — $neighborhood, $city/$state';
}
