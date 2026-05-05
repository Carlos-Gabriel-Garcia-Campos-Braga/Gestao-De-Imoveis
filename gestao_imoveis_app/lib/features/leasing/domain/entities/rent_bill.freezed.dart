// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentBill {
  int get id => throw _privateConstructorUsedError;
  int? get rentalContractId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get validationDate => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Create a copy of RentBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentBillCopyWith<RentBill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentBillCopyWith<$Res> {
  factory $RentBillCopyWith(RentBill value, $Res Function(RentBill) then) =
      _$RentBillCopyWithImpl<$Res, RentBill>;
  @useResult
  $Res call(
      {int id,
      int? rentalContractId,
      String type,
      DateTime validationDate,
      double value});
}

/// @nodoc
class _$RentBillCopyWithImpl<$Res, $Val extends RentBill>
    implements $RentBillCopyWith<$Res> {
  _$RentBillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rentalContractId = freezed,
    Object? type = null,
    Object? validationDate = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rentalContractId: freezed == rentalContractId
          ? _value.rentalContractId
          : rentalContractId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      validationDate: null == validationDate
          ? _value.validationDate
          : validationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentBillImplCopyWith<$Res>
    implements $RentBillCopyWith<$Res> {
  factory _$$RentBillImplCopyWith(
          _$RentBillImpl value, $Res Function(_$RentBillImpl) then) =
      __$$RentBillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? rentalContractId,
      String type,
      DateTime validationDate,
      double value});
}

/// @nodoc
class __$$RentBillImplCopyWithImpl<$Res>
    extends _$RentBillCopyWithImpl<$Res, _$RentBillImpl>
    implements _$$RentBillImplCopyWith<$Res> {
  __$$RentBillImplCopyWithImpl(
      _$RentBillImpl _value, $Res Function(_$RentBillImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rentalContractId = freezed,
    Object? type = null,
    Object? validationDate = null,
    Object? value = null,
  }) {
    return _then(_$RentBillImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rentalContractId: freezed == rentalContractId
          ? _value.rentalContractId
          : rentalContractId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      validationDate: null == validationDate
          ? _value.validationDate
          : validationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RentBillImpl implements _RentBill {
  const _$RentBillImpl(
      {required this.id,
      this.rentalContractId,
      required this.type,
      required this.validationDate,
      required this.value});

  @override
  final int id;
  @override
  final int? rentalContractId;
  @override
  final String type;
  @override
  final DateTime validationDate;
  @override
  final double value;

  @override
  String toString() {
    return 'RentBill(id: $id, rentalContractId: $rentalContractId, type: $type, validationDate: $validationDate, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentBillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rentalContractId, rentalContractId) ||
                other.rentalContractId == rentalContractId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.validationDate, validationDate) ||
                other.validationDate == validationDate) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, rentalContractId, type, validationDate, value);

  /// Create a copy of RentBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentBillImplCopyWith<_$RentBillImpl> get copyWith =>
      __$$RentBillImplCopyWithImpl<_$RentBillImpl>(this, _$identity);
}

abstract class _RentBill implements RentBill {
  const factory _RentBill(
      {required final int id,
      final int? rentalContractId,
      required final String type,
      required final DateTime validationDate,
      required final double value}) = _$RentBillImpl;

  @override
  int get id;
  @override
  int? get rentalContractId;
  @override
  String get type;
  @override
  DateTime get validationDate;
  @override
  double get value;

  /// Create a copy of RentBill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentBillImplCopyWith<_$RentBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
