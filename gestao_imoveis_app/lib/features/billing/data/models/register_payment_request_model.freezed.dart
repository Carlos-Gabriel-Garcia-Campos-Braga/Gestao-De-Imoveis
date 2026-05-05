// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_payment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterPaymentRequestModel _$RegisterPaymentRequestModelFromJson(
    Map<String, dynamic> json) {
  return _RegisterPaymentRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterPaymentRequestModel {
  double get amountPaid => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;

  /// Serializes this RegisterPaymentRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterPaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterPaymentRequestModelCopyWith<RegisterPaymentRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPaymentRequestModelCopyWith<$Res> {
  factory $RegisterPaymentRequestModelCopyWith(
          RegisterPaymentRequestModel value,
          $Res Function(RegisterPaymentRequestModel) then) =
      _$RegisterPaymentRequestModelCopyWithImpl<$Res,
          RegisterPaymentRequestModel>;
  @useResult
  $Res call({double amountPaid, String paymentMethod});
}

/// @nodoc
class _$RegisterPaymentRequestModelCopyWithImpl<$Res,
        $Val extends RegisterPaymentRequestModel>
    implements $RegisterPaymentRequestModelCopyWith<$Res> {
  _$RegisterPaymentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterPaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountPaid = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPaymentRequestModelImplCopyWith<$Res>
    implements $RegisterPaymentRequestModelCopyWith<$Res> {
  factory _$$RegisterPaymentRequestModelImplCopyWith(
          _$RegisterPaymentRequestModelImpl value,
          $Res Function(_$RegisterPaymentRequestModelImpl) then) =
      __$$RegisterPaymentRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amountPaid, String paymentMethod});
}

/// @nodoc
class __$$RegisterPaymentRequestModelImplCopyWithImpl<$Res>
    extends _$RegisterPaymentRequestModelCopyWithImpl<$Res,
        _$RegisterPaymentRequestModelImpl>
    implements _$$RegisterPaymentRequestModelImplCopyWith<$Res> {
  __$$RegisterPaymentRequestModelImplCopyWithImpl(
      _$RegisterPaymentRequestModelImpl _value,
      $Res Function(_$RegisterPaymentRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterPaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountPaid = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$RegisterPaymentRequestModelImpl(
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPaymentRequestModelImpl
    implements _RegisterPaymentRequestModel {
  const _$RegisterPaymentRequestModelImpl(
      {required this.amountPaid, this.paymentMethod = 'PIX'});

  factory _$RegisterPaymentRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegisterPaymentRequestModelImplFromJson(json);

  @override
  final double amountPaid;
  @override
  @JsonKey()
  final String paymentMethod;

  @override
  String toString() {
    return 'RegisterPaymentRequestModel(amountPaid: $amountPaid, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPaymentRequestModelImpl &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amountPaid, paymentMethod);

  /// Create a copy of RegisterPaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPaymentRequestModelImplCopyWith<_$RegisterPaymentRequestModelImpl>
      get copyWith => __$$RegisterPaymentRequestModelImplCopyWithImpl<
          _$RegisterPaymentRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPaymentRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterPaymentRequestModel
    implements RegisterPaymentRequestModel {
  const factory _RegisterPaymentRequestModel(
      {required final double amountPaid,
      final String paymentMethod}) = _$RegisterPaymentRequestModelImpl;

  factory _RegisterPaymentRequestModel.fromJson(Map<String, dynamic> json) =
      _$RegisterPaymentRequestModelImpl.fromJson;

  @override
  double get amountPaid;
  @override
  String get paymentMethod;

  /// Create a copy of RegisterPaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterPaymentRequestModelImplCopyWith<_$RegisterPaymentRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
