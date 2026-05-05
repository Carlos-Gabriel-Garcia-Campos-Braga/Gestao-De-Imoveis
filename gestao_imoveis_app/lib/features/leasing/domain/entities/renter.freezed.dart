// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Renter {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Create a copy of Renter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RenterCopyWith<Renter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenterCopyWith<$Res> {
  factory $RenterCopyWith(Renter value, $Res Function(Renter) then) =
      _$RenterCopyWithImpl<$Res, Renter>;
  @useResult
  $Res call({int id, String name, String cpf, String phoneNumber});
}

/// @nodoc
class _$RenterCopyWithImpl<$Res, $Val extends Renter>
    implements $RenterCopyWith<$Res> {
  _$RenterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Renter
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
abstract class _$$RenterImplCopyWith<$Res> implements $RenterCopyWith<$Res> {
  factory _$$RenterImplCopyWith(
          _$RenterImpl value, $Res Function(_$RenterImpl) then) =
      __$$RenterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String cpf, String phoneNumber});
}

/// @nodoc
class __$$RenterImplCopyWithImpl<$Res>
    extends _$RenterCopyWithImpl<$Res, _$RenterImpl>
    implements _$$RenterImplCopyWith<$Res> {
  __$$RenterImplCopyWithImpl(
      _$RenterImpl _value, $Res Function(_$RenterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Renter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$RenterImpl(
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

class _$RenterImpl extends _Renter {
  const _$RenterImpl(
      {required this.id,
      required this.name,
      required this.cpf,
      required this.phoneNumber})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String cpf;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'Renter(id: $id, name: $name, cpf: $cpf, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RenterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, cpf, phoneNumber);

  /// Create a copy of Renter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RenterImplCopyWith<_$RenterImpl> get copyWith =>
      __$$RenterImplCopyWithImpl<_$RenterImpl>(this, _$identity);
}

abstract class _Renter extends Renter {
  const factory _Renter(
      {required final int id,
      required final String name,
      required final String cpf,
      required final String phoneNumber}) = _$RenterImpl;
  const _Renter._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  String get cpf;
  @override
  String get phoneNumber;

  /// Create a copy of Renter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RenterImplCopyWith<_$RenterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
