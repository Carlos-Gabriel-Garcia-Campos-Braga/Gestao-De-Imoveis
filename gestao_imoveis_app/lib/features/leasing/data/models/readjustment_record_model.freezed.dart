// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'readjustment_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReadjustmentRecordModel _$ReadjustmentRecordModelFromJson(
    Map<String, dynamic> json) {
  return _ReadjustmentRecordModel.fromJson(json);
}

/// @nodoc
mixin _$ReadjustmentRecordModel {
  int get contractId => throw _privateConstructorUsedError;
  String get index => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get oldValue => throw _privateConstructorUsedError;
  double get newValue => throw _privateConstructorUsedError;
  DateTime get appliedAt => throw _privateConstructorUsedError;

  /// Serializes this ReadjustmentRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadjustmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadjustmentRecordModelCopyWith<ReadjustmentRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadjustmentRecordModelCopyWith<$Res> {
  factory $ReadjustmentRecordModelCopyWith(ReadjustmentRecordModel value,
          $Res Function(ReadjustmentRecordModel) then) =
      _$ReadjustmentRecordModelCopyWithImpl<$Res, ReadjustmentRecordModel>;
  @useResult
  $Res call(
      {int contractId,
      String index,
      double rate,
      double oldValue,
      double newValue,
      DateTime appliedAt});
}

/// @nodoc
class _$ReadjustmentRecordModelCopyWithImpl<$Res,
        $Val extends ReadjustmentRecordModel>
    implements $ReadjustmentRecordModelCopyWith<$Res> {
  _$ReadjustmentRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadjustmentRecordModel
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
              as String,
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
abstract class _$$ReadjustmentRecordModelImplCopyWith<$Res>
    implements $ReadjustmentRecordModelCopyWith<$Res> {
  factory _$$ReadjustmentRecordModelImplCopyWith(
          _$ReadjustmentRecordModelImpl value,
          $Res Function(_$ReadjustmentRecordModelImpl) then) =
      __$$ReadjustmentRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int contractId,
      String index,
      double rate,
      double oldValue,
      double newValue,
      DateTime appliedAt});
}

/// @nodoc
class __$$ReadjustmentRecordModelImplCopyWithImpl<$Res>
    extends _$ReadjustmentRecordModelCopyWithImpl<$Res,
        _$ReadjustmentRecordModelImpl>
    implements _$$ReadjustmentRecordModelImplCopyWith<$Res> {
  __$$ReadjustmentRecordModelImplCopyWithImpl(
      _$ReadjustmentRecordModelImpl _value,
      $Res Function(_$ReadjustmentRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadjustmentRecordModel
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
    return _then(_$ReadjustmentRecordModelImpl(
      contractId: null == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$ReadjustmentRecordModelImpl implements _ReadjustmentRecordModel {
  const _$ReadjustmentRecordModelImpl(
      {required this.contractId,
      required this.index,
      required this.rate,
      required this.oldValue,
      required this.newValue,
      required this.appliedAt});

  factory _$ReadjustmentRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadjustmentRecordModelImplFromJson(json);

  @override
  final int contractId;
  @override
  final String index;
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
    return 'ReadjustmentRecordModel(contractId: $contractId, index: $index, rate: $rate, oldValue: $oldValue, newValue: $newValue, appliedAt: $appliedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadjustmentRecordModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, contractId, index, rate, oldValue, newValue, appliedAt);

  /// Create a copy of ReadjustmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadjustmentRecordModelImplCopyWith<_$ReadjustmentRecordModelImpl>
      get copyWith => __$$ReadjustmentRecordModelImplCopyWithImpl<
          _$ReadjustmentRecordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadjustmentRecordModelImplToJson(
      this,
    );
  }
}

abstract class _ReadjustmentRecordModel implements ReadjustmentRecordModel {
  const factory _ReadjustmentRecordModel(
      {required final int contractId,
      required final String index,
      required final double rate,
      required final double oldValue,
      required final double newValue,
      required final DateTime appliedAt}) = _$ReadjustmentRecordModelImpl;

  factory _ReadjustmentRecordModel.fromJson(Map<String, dynamic> json) =
      _$ReadjustmentRecordModelImpl.fromJson;

  @override
  int get contractId;
  @override
  String get index;
  @override
  double get rate;
  @override
  double get oldValue;
  @override
  double get newValue;
  @override
  DateTime get appliedAt;

  /// Create a copy of ReadjustmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadjustmentRecordModelImplCopyWith<_$ReadjustmentRecordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
