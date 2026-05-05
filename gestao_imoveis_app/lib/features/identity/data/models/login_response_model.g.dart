// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserOutputModelImpl _$$UserOutputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserOutputModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserOutputModelImplToJson(
        _$UserOutputModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseModelImpl(
      user: UserOutputModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiresAt:
          DateTime.parse(json['accessTokenExpiresAt'] as String),
      refreshTokenExpiresAt:
          DateTime.parse(json['refreshTokenExpiresAt'] as String),
    );

Map<String, dynamic> _$$LoginResponseModelImplToJson(
        _$LoginResponseModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt.toIso8601String(),
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt.toIso8601String(),
    };

_$RefreshRequestModelImpl _$$RefreshRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshRequestModelImpl(
      refreshToken: json['refreshToken'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$$RefreshRequestModelImplToJson(
        _$RefreshRequestModelImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
    };
