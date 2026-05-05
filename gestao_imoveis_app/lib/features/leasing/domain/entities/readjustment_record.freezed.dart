// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'readjustment_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReadjustmentRecord {
  int get contractId => throw _privateConstructorUsedError;
  EconomicIndex get index => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get oldValue => throw _privateConstructorUsedError;
  double get newValue => throw _privateConstructorUsedError;
  DateTime get appliedAt => throw _privateConstructorUsedError;

  /// Create a copy of ReadjustmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadjustmentRecordCopyWith<ReadjustmentRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadjustmentRecordCopyWith<$Res> {
  factory $ReadjustmentRecordCopyWith(
          ReadjustmentRecord value, $Res Function(ReadjustmentRecord) then) =
      _$ReadjustmentRecordCopyWithImpl<$Res, ReadjustmentRecord>;
  @useResult
  $Res call(
      {int contractId,
      EconomicIndex index,
      double rate,
      double oldValue,
      double newValue,
      DateTime appliedAt});
}

/// @nodoc
class _$ReadjustmentRecordCopyWithImpl<$Res, $Val extends ReadjustmentRecord>
    implements $ReadjustmentRecordCopyWith<$Res> {
  _$ReadjustmentRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadjustmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractId = null,
    Object? index = null,
    Object? rate = null,
    Object? oldValue = null,
    Object? newValue = null,
    Object? appliedAt = null,
  }) {
    return _then(_value.copyWith(
      contractId: null == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as EconomicIndex,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as double,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as double,
      appliedAt: null == appliedAt
          ? _value.appliedAt
          : appliedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadjustmentRecordImplCopyWith<$Res>
    implements $ReadjustmentRecordCopyWith<$Res> {
  factory _$$ReadjustmentRecordImplCopyWith(_$ReadjustmentRecordImpl value,
          $Res Function(_$ReadjustmentRecordImpl) then) =
      __$$ReadjustmentRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contractId,
      EconomicIndex index,
      double rate,
      double oldValue,
      double newValue,
      DateTime appliedAt});
}

/// @nodoc
class __$$ReadjustmentRecordImplCopyWithImpl<$Res>
    extends _$ReadjustmentRecordCopyWithImpl<$Res, _$ReadjustmentRecordImpl>
    implements _$$ReadjustmentRecordImplCopyWith<$Res> {
  __$$ReadjustmentRecordImplCopyWithImpl(_$ReadjustmentRecordImpl _value,
      $Res Function(_$ReadjustmentRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadjustmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractId = null,
    Object? index = null,
    Object? rate = null,
    Object? oldValue = null,
    Object? newValue = null,
    Object? appliedAt = null,
  }) {
    return _then(_$ReadjustmentRecordImpl(
      contractId: null == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as EconomicIndex,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as double,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as double,
      appliedAt: null == appliedAt
          ? _value.appliedAt
          : appliedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ReadjustmentRecordImpl implements _ReadjustmentRecord {
  const _$ReadjustmentRecordImpl(
      {required this.contractId,
      required this.index,
      required this.rate,
      required this.oldValue,
      required this.newValue,
      required this.appliedAt});

  @override
  final int contractId;
  @override
  final EconomicIndex index;
  @override
  final double rate;
  @override
  final double oldValue;
  @override
  final double newValue;
  @override
  final DateTime appliedAt;

  @override
  String toString() {
    return 'ReadjustmentRecord(contractId: $contractId, index: $index, rate: $rate, oldValue: $oldValue, newValue: $newValue, appliedAt: $appliedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadjustmentRecordImpl &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.appliedAt, appliedAt) ||
                other.appliedAt == appliedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, contractId, index, rate, oldValue, newValue, appliedAt);

  /// Create a copy of ReadjustmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadjustmentRecordImplCopyWith<_$ReadjustmentRecordImpl> get copyWith =>
      __$$ReadjustmentRecordImplCopyWithImpl<_$ReadjustmentRecordImpl>(
          this, _$identity);
}

abstract class _ReadjustmentRecord implements ReadjustmentRecord {
  const factory _ReadjustmentRecord(
      {required final int contractId,
      required final EconomicIndex index,
      required final double rate,
      required final double oldValue,
      required final double newValue,
      required final DateTime appliedAt}) = _$ReadjustmentRecordImpl;

  @override
  int get contractId;
  @override
  EconomicIndex get index;
  @override
  double get rate;
  @override
  double get oldValue;
  @override
  double get newValue;
  @override
  DateTime get appliedAt;

  /// Create a copy of ReadjustmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadjustmentRecordImplCopyWith<_$ReadjustmentRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
