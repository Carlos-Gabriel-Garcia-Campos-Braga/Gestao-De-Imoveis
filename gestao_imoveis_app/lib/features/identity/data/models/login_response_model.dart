import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class UserOutputModel with _$UserOutputModel {
  const factory UserOutputModel({
    required int id,
    required String name,
    required String email,
  }) = _UserOutputModel;

  factory UserOutputModel.fromJson(Map<String, dynamic> json) =>
      _$UserOutputModelFromJson(json);
}

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required UserOutputModel user,
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiresAt,
    required DateTime refreshTokenExpiresAt,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@freezed
class RefreshRequestModel with _$RefreshRequestModel {
  const factory RefreshRequestModel({
    required String refreshToken,
    required int userId,
  }) = _RefreshRequestModel;

  factory RefreshRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestModelFromJson(json);
}
