// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserOutputModel _$UserOutputModelFromJson(Map<String, dynamic> json) {
  return _UserOutputModel.fromJson(json);
}

/// @nodoc
mixin _$UserOutputModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this UserOutputModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserOutputModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserOutputModelCopyWith<UserOutputModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOutputModelCopyWith<$Res> {
  factory $UserOutputModelCopyWith(
          UserOutputModel value, $Res Function(UserOutputModel) then) =
      _$UserOutputModelCopyWithImpl<$Res, UserOutputModel>;
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class _$UserOutputModelCopyWithImpl<$Res, $Val extends UserOutputModel>
    implements $UserOutputModelCopyWith<$Res> {
  _$UserOutputModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserOutputModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOutputModelImplCopyWith<$Res>
    implements $UserOutputModelCopyWith<$Res> {
  factory _$$UserOutputModelImplCopyWith(_$UserOutputModelImpl value,
          $Res Function(_$UserOutputModelImpl) then) =
      __$$UserOutputModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class __$$UserOutputModelImplCopyWithImpl<$Res>
    extends _$UserOutputModelCopyWithImpl<$Res, _$UserOutputModelImpl>
    implements _$$UserOutputModelImplCopyWith<$Res> {
  __$$UserOutputModelImplCopyWithImpl(
      _$UserOutputModelImpl _value, $Res Function(_$UserOutputModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserOutputModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$UserOutputModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserOutputModelImpl implements _UserOutputModel {
  const _$UserOutputModelImpl(
      {required this.id, required this.name, required this.email});

  factory _$UserOutputModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOutputModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'UserOutputModel(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOutputModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  /// Create a copy of UserOutputModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOutputModelImplCopyWith<_$UserOutputModelImpl> get copyWith =>
      __$$UserOutputModelImplCopyWithImpl<_$UserOutputModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOutputModelImplToJson(
      this,
    );
  }
}

abstract class _UserOutputModel implements UserOutputModel {
  const factory _UserOutputModel(
      {required final int id,
      required final String name,
      required final String email}) = _$UserOutputModelImpl;

  factory _UserOutputModel.fromJson(Map<String, dynamic> json) =
      _$UserOutputModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of UserOutputModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserOutputModelImplCopyWith<_$UserOutputModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) {
  return _LoginResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseModel {
  UserOutputModel get user => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  DateTime get accessTokenExpiresAt => throw _privateConstructorUsedError;
  DateTime get refreshTokenExpiresAt => throw _privateConstructorUsedError;

  /// Serializes this LoginResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseModelCopyWith<LoginResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseModelCopyWith<$Res> {
  factory $LoginResponseModelCopyWith(
          LoginResponseModel value, $Res Function(LoginResponseModel) then) =
      _$LoginResponseModelCopyWithImpl<$Res, LoginResponseModel>;
  @useResult
  $Res call(
      {UserOutputModel user,
      String accessToken,
      String refreshToken,
      DateTime accessTokenExpiresAt,
      DateTime refreshTokenExpiresAt});

  $UserOutputModelCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res, $Val extends LoginResponseModel>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenExpiresAt = null,
    Object? refreshTokenExpiresAt = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserOutputModel,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenExpiresAt: null == accessTokenExpiresAt
          ? _value.accessTokenExpiresAt
          : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refreshTokenExpiresAt: null == refreshTokenExpiresAt
          ? _value.refreshTokenExpiresAt
          : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserOutputModelCopyWith<$Res> get user {
    return $UserOutputModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseModelImplCopyWith<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  factory _$$LoginResponseModelImplCopyWith(_$LoginResponseModelImpl value,
          $Res Function(_$LoginResponseModelImpl) then) =
      __$$LoginResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserOutputModel user,
      String accessToken,
      String refreshToken,
      DateTime accessTokenExpiresAt,
      DateTime refreshTokenExpiresAt});

  @override
  $UserOutputModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginResponseModelImplCopyWithImpl<$Res>
    extends _$LoginResponseModelCopyWithImpl<$Res, _$LoginResponseModelImpl>
    implements _$$LoginResponseModelImplCopyWith<$Res> {
  __$$LoginResponseModelImplCopyWithImpl(_$LoginResponseModelImpl _value,
      $Res Function(_$LoginResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenExpiresAt = null,
    Object? refreshTokenExpiresAt = null,
  }) {
    return _then(_$LoginResponseModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserOutputModel,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenExpiresAt: null == accessTokenExpiresAt
          ? _value.accessTokenExpiresAt
          : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refreshTokenExpiresAt: null == refreshTokenExpiresAt
          ? _value.refreshTokenExpiresAt
          : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseModelImpl implements _LoginResponseModel {
  const _$LoginResponseModelImpl(
      {required this.user,
      required this.accessToken,
      required this.refreshToken,
      required this.accessTokenExpiresAt,
      required this.refreshTokenExpiresAt});

  factory _$LoginResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseModelImplFromJson(json);

  @override
  final UserOutputModel user;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final DateTime accessTokenExpiresAt;
  @override
  final DateTime refreshTokenExpiresAt;

  @override
  String toString() {
    return 'LoginResponseModel(user: $user, accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresAt: $accessTokenExpiresAt, refreshTokenExpiresAt: $refreshTokenExpiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessTokenExpiresAt, accessTokenExpiresAt) ||
                other.accessTokenExpiresAt == accessTokenExpiresAt) &&
            (identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) ||
                other.refreshTokenExpiresAt == refreshTokenExpiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken,
      accessTokenExpiresAt, refreshTokenExpiresAt);

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseModelImplCopyWith<_$LoginResponseModelImpl> get copyWith =>
      __$$LoginResponseModelImplCopyWithImpl<_$LoginResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LoginResponseModel implements LoginResponseModel {
  const factory _LoginResponseModel(
          {required final UserOutputModel user,
          required final String accessToken,
          required final String refreshToken,
          required final DateTime accessTokenExpiresAt,
          required final DateTime refreshTokenExpiresAt}) =
      _$LoginResponseModelImpl;

  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) =
      _$LoginResponseModelImpl.fromJson;

  @override
  UserOutputModel get user;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  DateTime get accessTokenExpiresAt;
  @override
  DateTime get refreshTokenExpiresAt;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseModelImplCopyWith<_$LoginResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshRequestModel _$RefreshRequestModelFromJson(Map<String, dynamic> json) {
  return _RefreshRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshRequestModel {
  String get refreshToken => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  /// Serializes this RefreshRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshRequestModelCopyWith<RefreshRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshRequestModelCopyWith<$Res> {
  factory $RefreshRequestModelCopyWith(
          RefreshRequestModel value, $Res Function(RefreshRequestModel) then) =
      _$RefreshRequestModelCopyWithImpl<$Res, RefreshRequestModel>;
  @useResult
  $Res call({String refreshToken, int userId});
}

/// @nodoc
class _$RefreshRequestModelCopyWithImpl<$Res, $Val extends RefreshRequestModel>
    implements $RefreshRequestModelCopyWith<$Res> {
  _$RefreshRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshRequestModelImplCopyWith<$Res>
    implements $RefreshRequestModelCopyWith<$Res> {
  factory _$$RefreshRequestModelImplCopyWith(_$RefreshRequestModelImpl value,
          $Res Function(_$RefreshRequestModelImpl) then) =
      __$$RefreshRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken, int userId});
}

/// @nodoc
class __$$RefreshRequestModelImplCopyWithImpl<$Res>
    extends _$RefreshRequestModelCopyWithImpl<$Res, _$RefreshRequestModelImpl>
    implements _$$RefreshRequestModelImplCopyWith<$Res> {
  __$$RefreshRequestModelImplCopyWithImpl(_$RefreshRequestModelImpl _value,
      $Res Function(_$RefreshRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? userId = null,
  }) {
    return _then(_$RefreshRequestModelImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshRequestModelImpl implements _RefreshRequestModel {
  const _$RefreshRequestModelImpl(
      {required this.refreshToken, required this.userId});

  factory _$RefreshRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshRequestModelImplFromJson(json);

  @override
  final String refreshToken;
  @override
  final int userId;

  @override
  String toString() {
    return 'RefreshRequestModel(refreshToken: $refreshToken, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshRequestModelImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken, userId);

  /// Create a copy of RefreshRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshRequestModelImplCopyWith<_$RefreshRequestModelImpl> get copyWith =>
      __$$RefreshRequestModelImplCopyWithImpl<_$RefreshRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RefreshRequestModel implements RefreshRequestModel {
  const factory _RefreshRequestModel(
      {required final String refreshToken,
      required final int userId}) = _$RefreshRequestModelImpl;

  factory _RefreshRequestModel.fromJson(Map<String, dynamic> json) =
      _$RefreshRequestModelImpl.fromJson;

  @override
  String get refreshToken;
  @override
  int get userId;

  /// Create a copy of RefreshRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshRequestModelImplCopyWith<_$RefreshRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
