// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_readjustment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplyReadjustmentRequestModel _$ApplyReadjustmentRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ApplyReadjustmentRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ApplyReadjustmentRequestModel {
  String? get index => throw _privateConstructorUsedError;
  double? get manualRate => throw _privateConstructorUsedError;

  /// Serializes this ApplyReadjustmentRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplyReadjustmentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplyReadjustmentRequestModelCopyWith<ApplyReadjustmentRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyReadjustmentRequestModelCopyWith<$Res> {
  factory $ApplyReadjustmentRequestModelCopyWith(
          ApplyReadjustmentRequestModel value,
          $Res Function(ApplyReadjustmentRequestModel) then) =
      _$ApplyReadjustmentRequestModelCopyWithImpl<$Res,
          ApplyReadjustmentRequestModel>;
  @useResult
  $Res call({String? index, double? manualRate});
}

/// @nodoc
class _$ApplyReadjustmentRequestModelCopyWithImpl<$Res,
        $Val extends ApplyReadjustmentRequestModel>
    implements $ApplyReadjustmentRequestModelCopyWith<$Res> {
  _$ApplyReadjustmentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplyReadjustmentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? manualRate = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      manualRate: freezed == manualRate
          ? _value.manualRate
          : manualRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplyReadjustmentRequestModelImplCopyWith<$Res>
    implements $ApplyReadjustmentRequestModelCopyWith<$Res> {
  factory _$$ApplyReadjustmentRequestModelImplCopyWith(
          _$ApplyReadjustmentRequestModelImpl value,
          $Res Function(_$ApplyReadjustmentRequestModelImpl) then) =
      __$$ApplyReadjustmentRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? index, double? manualRate});
}

/// @nodoc
class __$$ApplyReadjustmentRequestModelImplCopyWithImpl<$Res>
    extends _$ApplyReadjustmentRequestModelCopyWithImpl<$Res,
        _$ApplyReadjustmentRequestModelImpl>
    implements _$$ApplyReadjustmentRequestModelImplCopyWith<$Res> {
  __$$ApplyReadjustmentRequestModelImplCopyWithImpl(
      _$ApplyReadjustmentRequestModelImpl _value,
      $Res Function(_$ApplyReadjustmentRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplyReadjustmentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? manualRate = freezed,
  }) {
    return _then(_$ApplyReadjustmentRequestModelImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      manualRate: freezed == manualRate
          ? _value.manualRate
          : manualRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplyReadjustmentRequestModelImpl
    implements _ApplyReadjustmentRequestModel {
  const _$ApplyReadjustmentRequestModelImpl({this.index, this.manualRate});

  factory _$ApplyReadjustmentRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApplyReadjustmentRequestModelImplFromJson(json);

  @override
  final String? index;
  @override
  final double? manualRate;

  @override
  String toString() {
    return 'ApplyReadjustmentRequestModel(index: $index, manualRate: $manualRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyReadjustmentRequestModelImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.manualRate, manualRate) ||
                other.manualRate == manualRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, manualRate);

  /// Create a copy of ApplyReadjustmentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyReadjustmentRequestModelImplCopyWith<
          _$ApplyReadjustmentRequestModelImpl>
      get copyWith => __$$ApplyReadjustmentRequestModelImplCopyWithImpl<
          _$ApplyReadjustmentRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplyReadjustmentRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ApplyReadjustmentRequestModel
    implements ApplyReadjustmentRequestModel {
  const factory _ApplyReadjustmentRequestModel(
      {final String? index,
      final double? manualRate}) = _$ApplyReadjustmentRequestModelImpl;

  factory _ApplyReadjustmentRequestModel.fromJson(Map<String, dynamic> json) =
      _$ApplyReadjustmentRequestModelImpl.fromJson;

  @override
  String? get index;
  @override
  double? get manualRate;

  /// Create a copy of ApplyReadjustmentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyReadjustmentRequestModelImplCopyWith<
          _$ApplyReadjustmentRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
