import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_property_request_model.freezed.dart';
part 'create_property_request_model.g.dart';

@freezed
class CreatePropertyRequestModel with _$CreatePropertyRequestModel {
  const factory CreatePropertyRequestModel({
    required String description,
    required String type,
    required String zipCode,
    String? number,
    String? complement,
  }) = _CreatePropertyRequestModel;

  factory CreatePropertyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyRequestModelFromJson(json);
}
