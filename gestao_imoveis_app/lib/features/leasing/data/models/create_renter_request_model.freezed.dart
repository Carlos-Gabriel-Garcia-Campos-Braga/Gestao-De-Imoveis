// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_renter_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateRenterRequestModel _$CreateRenterRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateRenterRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateRenterRequestModel {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'cPF')
  String get cpf => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this CreateRenterRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateRenterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRenterRequestModelCopyWith<CreateRenterRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRenterRequestModelCopyWith<$Res> {
  factory $CreateRenterRequestModelCopyWith(CreateRenterRequestModel value,
          $Res Function(CreateRenterRequestModel) then) =
      _$CreateRenterRequestModelCopyWithImpl<$Res, CreateRenterRequestModel>;
  @useResult
  $Res call(
      {String name, @JsonKey(name: 'cPF') String cpf, String phoneNumber});
}

/// @nodoc
class _$CreateRenterRequestModelCopyWithImpl<$Res,
        $Val extends CreateRenterRequestModel>
    implements $CreateRenterRequestModelCopyWith<$Res> {
  _$CreateRenterRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRenterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRenterRequestModelImplCopyWith<$Res>
    implements $CreateRenterRequestModelCopyWith<$Res> {
  factory _$$CreateRenterRequestModelImplCopyWith(
          _$CreateRenterRequestModelImpl value,
          $Res Function(_$CreateRenterRequestModelImpl) then) =
      __$$CreateRenterRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, @JsonKey(name: 'cPF') String cpf, String phoneNumber});
}

/// @nodoc
class __$$CreateRenterRequestModelImplCopyWithImpl<$Res>
    extends _$CreateRenterRequestModelCopyWithImpl<$Res,
        _$CreateRenterRequestModelImpl>
    implements _$$CreateRenterRequestModelImplCopyWith<$Res> {
  __$$CreateRenterRequestModelImplCopyWithImpl(
      _$CreateRenterRequestModelImpl _value,
      $Res Function(_$CreateRenterRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRenterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$CreateRenterRequestModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRenterRequestModelImpl implements _CreateRenterRequestModel {
  const _$CreateRenterRequestModelImpl(
      {required this.name,
      @JsonKey(name: 'cPF') required this.cpf,
      required this.phoneNumber});

  factory _$CreateRenterRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRenterRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'cPF')
  final String cpf;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'CreateRenterRequestModel(name: $name, cpf: $cpf, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRenterRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, cpf, phoneNumber);

  /// Create a copy of CreateRenterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRenterRequestModelImplCopyWith<_$CreateRenterRequestModelImpl>
      get copyWith => __$$CreateRenterRequestModelImplCopyWithImpl<
          _$CreateRenterRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRenterRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateRenterRequestModel implements CreateRenterRequestModel {
  const factory _CreateRenterRequestModel(
      {required final String name,
      @JsonKey(name: 'cPF') required final String cpf,
      required final String phoneNumber}) = _$CreateRenterRequestModelImpl;

  factory _CreateRenterRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateRenterRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'cPF')
  String get cpf;
  @override
  String get phoneNumber;

  /// Create a copy of CreateRenterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRenterRequestModelImplCopyWith<_$CreateRenterRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
