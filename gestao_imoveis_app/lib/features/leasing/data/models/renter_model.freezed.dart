// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RenterModel _$RenterModelFromJson(Map<String, dynamic> json) {
  return _RenterModel.fromJson(json);
}

/// @nodoc
mixin _$RenterModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'cPF')
  String get cpf => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this RenterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RenterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RenterModelCopyWith<RenterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenterModelCopyWith<$Res> {
  factory $RenterModelCopyWith(
          RenterModel value, $Res Function(RenterModel) then) =
      _$RenterModelCopyWithImpl<$Res, RenterModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'cPF') String cpf,
      @JsonKey(name: 'phoneNumber') String phoneNumber});
}

/// @nodoc
class _$RenterModelCopyWithImpl<$Res, $Val extends RenterModel>
    implements $RenterModelCopyWith<$Res> {
  _$RenterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RenterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
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
abstract class _$$RenterModelImplCopyWith<$Res>
    implements $RenterModelCopyWith<$Res> {
  factory _$$RenterModelImplCopyWith(
          _$RenterModelImpl value, $Res Function(_$RenterModelImpl) then) =
      __$$RenterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'cPF') String cpf,
      @JsonKey(name: 'phoneNumber') String phoneNumber});
}

/// @nodoc
class __$$RenterModelImplCopyWithImpl<$Res>
    extends _$RenterModelCopyWithImpl<$Res, _$RenterModelImpl>
    implements _$$RenterModelImplCopyWith<$Res> {
  __$$RenterModelImplCopyWithImpl(
      _$RenterModelImpl _value, $Res Function(_$RenterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RenterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$RenterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$RenterModelImpl implements _RenterModel {
  const _$RenterModelImpl(
      {required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'cPF') required this.cpf,
      @JsonKey(name: 'phoneNumber') required this.phoneNumber});

  factory _$RenterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RenterModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'cPF')
  final String cpf;
  @override
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @override
  String toString() {
    return 'RenterModel(id: $id, name: $name, cpf: $cpf, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RenterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, cpf, phoneNumber);

  /// Create a copy of RenterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RenterModelImplCopyWith<_$RenterModelImpl> get copyWith =>
      __$$RenterModelImplCopyWithImpl<_$RenterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RenterModelImplToJson(
      this,
    );
  }
}

abstract class _RenterModel implements RenterModel {
  const factory _RenterModel(
          {required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'cPF') required final String cpf,
          @JsonKey(name: 'phoneNumber') required final String phoneNumber}) =
      _$RenterModelImpl;

  factory _RenterModel.fromJson(Map<String, dynamic> json) =
      _$RenterModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'cPF')
  String get cpf;
  @override
  @JsonKey(name: 'phoneNumber')
  String get phoneNumber;

  /// Create a copy of RenterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RenterModelImplCopyWith<_$RenterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
