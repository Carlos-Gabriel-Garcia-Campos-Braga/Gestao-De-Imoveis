import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_renter_request_model.freezed.dart';
part 'create_renter_request_model.g.dart';

@freezed
class CreateRenterRequestModel with _$CreateRenterRequestModel {
  const factory CreateRenterRequestModel({
    required String name,
    @JsonKey(name: 'cPF') required String cpf,
    required String phoneNumber,
  }) = _CreateRenterRequestModel;

  factory CreateRenterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRenterRequestModelFromJson(json);
}
