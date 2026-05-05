// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PixCharge {
  String get qrCode => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Create a copy of PixCharge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixChargeCopyWith<PixCharge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixChargeCopyWith<$Res> {
  factory $PixChargeCopyWith(PixCharge value, $Res Function(PixCharge) then) =
      _$PixChargeCopyWithImpl<$Res, PixCharge>;
  @useResult
  $Res call({String qrCode, DateTime expiresAt, String status});
}

/// @nodoc
class _$PixChargeCopyWithImpl<$Res, $Val extends PixCharge>
    implements $PixChargeCopyWith<$Res> {
  _$PixChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixCharge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? expiresAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixChargeImplCopyWith<$Res>
    implements $PixChargeCopyWith<$Res> {
  factory _$$PixChargeImplCopyWith(
          _$PixChargeImpl value, $Res Function(_$PixChargeImpl) then) =
      __$$PixChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qrCode, DateTime expiresAt, String status});
}

/// @nodoc
class __$$PixChargeImplCopyWithImpl<$Res>
    extends _$PixChargeCopyWithImpl<$Res, _$PixChargeImpl>
    implements _$$PixChargeImplCopyWith<$Res> {
  __$$PixChargeImplCopyWithImpl(
      _$PixChargeImpl _value, $Res Function(_$PixChargeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixCharge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? expiresAt = null,
    Object? status = null,
  }) {
    return _then(_$PixChargeImpl(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PixChargeImpl implements _PixCharge {
  const _$PixChargeImpl(
      {required this.qrCode, required this.expiresAt, required this.status});

  @override
  final String qrCode;
  @override
  final DateTime expiresAt;
  @override
  final String status;

  @override
  String toString() {
    return 'PixCharge(qrCode: $qrCode, expiresAt: $expiresAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixChargeImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrCode, expiresAt, status);

  /// Create a copy of PixCharge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixChargeImplCopyWith<_$PixChargeImpl> get copyWith =>
      __$$PixChargeImplCopyWithImpl<_$PixChargeImpl>(this, _$identity);
}

abstract class _PixCharge implements PixCharge {
  const factory _PixCharge(
      {required final String qrCode,
      required final DateTime expiresAt,
      required final String status}) = _$PixChargeImpl;

  @override
  String get qrCode;
  @override
  DateTime get expiresAt;
  @override
  String get status;

  /// Create a copy of PixCharge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixChargeImplCopyWith<_$PixChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LateFee {
  int get daysOverdue => throw _privateConstructorUsedError;
  double get lateFeeAmount => throw _privateConstructorUsedError;
  double get interestAmount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;

  /// Create a copy of LateFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LateFeeCopyWith<LateFee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LateFeeCopyWith<$Res> {
  factory $LateFeeCopyWith(LateFee value, $Res Function(LateFee) then) =
      _$LateFeeCopyWithImpl<$Res, LateFee>;
  @useResult
  $Res call(
      {int daysOverdue,
      double lateFeeAmount,
      double interestAmount,
      double totalAmount});
}

/// @nodoc
class _$LateFeeCopyWithImpl<$Res, $Val extends LateFee>
    implements $LateFeeCopyWith<$Res> {
  _$LateFeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LateFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysOverdue = null,
    Object? lateFeeAmount = null,
    Object? interestAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_value.copyWith(
      daysOverdue: null == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lateFeeAmount: null == lateFeeAmount
          ? _value.lateFeeAmount
          : lateFeeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      interestAmount: null == interestAmount
          ? _value.interestAmount
          : interestAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LateFeeImplCopyWith<$Res> implements $LateFeeCopyWith<$Res> {
  factory _$$LateFeeImplCopyWith(
          _$LateFeeImpl value, $Res Function(_$LateFeeImpl) then) =
      __$$LateFeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int daysOverdue,
      double lateFeeAmount,
      double interestAmount,
      double totalAmount});
}

/// @nodoc
class __$$LateFeeImplCopyWithImpl<$Res>
    extends _$LateFeeCopyWithImpl<$Res, _$LateFeeImpl>
    implements _$$LateFeeImplCopyWith<$Res> {
  __$$LateFeeImplCopyWithImpl(
      _$LateFeeImpl _value, $Res Function(_$LateFeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LateFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysOverdue = null,
    Object? lateFeeAmount = null,
    Object? interestAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_$LateFeeImpl(
      daysOverdue: null == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lateFeeAmount: null == lateFeeAmount
          ? _value.lateFeeAmount
          : lateFeeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      interestAmount: null == interestAmount
          ? _value.interestAmount
          : interestAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LateFeeImpl implements _LateFee {
  const _$LateFeeImpl(
      {required this.daysOverdue,
      required this.lateFeeAmount,
      required this.interestAmount,
      required this.totalAmount});

  @override
  final int daysOverdue;
  @override
  final double lateFeeAmount;
  @override
  final double interestAmount;
  @override
  final double totalAmount;

  @override
  String toString() {
    return 'LateFee(daysOverdue: $daysOverdue, lateFeeAmount: $lateFeeAmount, interestAmount: $interestAmount, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LateFeeImpl &&
            (identical(other.daysOverdue, daysOverdue) ||
                other.daysOverdue == daysOverdue) &&
            (identical(other.lateFeeAmount, lateFeeAmount) ||
                other.lateFeeAmount == lateFeeAmount) &&
            (identical(other.interestAmount, interestAmount) ||
                other.interestAmount == interestAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, daysOverdue, lateFeeAmount, interestAmount, totalAmount);

  /// Create a copy of LateFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LateFeeImplCopyWith<_$LateFeeImpl> get copyWith =>
      __$$LateFeeImplCopyWithImpl<_$LateFeeImpl>(this, _$identity);
}

abstract class _LateFee implements LateFee {
  const factory _LateFee(
      {required final int daysOverdue,
      required final double lateFeeAmount,
      required final double interestAmount,
      required final double totalAmount}) = _$LateFeeImpl;

  @override
  int get daysOverdue;
  @override
  double get lateFeeAmount;
  @override
  double get interestAmount;
  @override
  double get totalAmount;

  /// Create a copy of LateFee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LateFeeImplCopyWith<_$LateFeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentRecord {
  DateTime get paidAt => throw _privateConstructorUsedError;
  double get amountPaid => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRecordCopyWith<PaymentRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRecordCopyWith<$Res> {
  factory $PaymentRecordCopyWith(
          PaymentRecord value, $Res Function(PaymentRecord) then) =
      _$PaymentRecordCopyWithImpl<$Res, PaymentRecord>;
  @useResult
  $Res call({DateTime paidAt, double amountPaid, String paymentMethod});
}

/// @nodoc
class _$PaymentRecordCopyWithImpl<$Res, $Val extends PaymentRecord>
    implements $PaymentRecordCopyWith<$Res> {
  _$PaymentRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidAt = null,
    Object? amountPaid = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$PaymentRecordImplCopyWith<$Res>
    implements $PaymentRecordCopyWith<$Res> {
  factory _$$PaymentRecordImplCopyWith(
          _$PaymentRecordImpl value, $Res Function(_$PaymentRecordImpl) then) =
      __$$PaymentRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime paidAt, double amountPaid, String paymentMethod});
}

/// @nodoc
class __$$PaymentRecordImplCopyWithImpl<$Res>
    extends _$PaymentRecordCopyWithImpl<$Res, _$PaymentRecordImpl>
    implements _$$PaymentRecordImplCopyWith<$Res> {
  __$$PaymentRecordImplCopyWithImpl(
      _$PaymentRecordImpl _value, $Res Function(_$PaymentRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidAt = null,
    Object? amountPaid = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$PaymentRecordImpl(
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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

class _$PaymentRecordImpl implements _PaymentRecord {
  const _$PaymentRecordImpl(
      {required this.paidAt,
      required this.amountPaid,
      required this.paymentMethod});

  @override
  final DateTime paidAt;
  @override
  final double amountPaid;
  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'PaymentRecord(paidAt: $paidAt, amountPaid: $amountPaid, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRecordImpl &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paidAt, amountPaid, paymentMethod);

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRecordImplCopyWith<_$PaymentRecordImpl> get copyWith =>
      __$$PaymentRecordImplCopyWithImpl<_$PaymentRecordImpl>(this, _$identity);
}

abstract class _PaymentRecord implements PaymentRecord {
  const factory _PaymentRecord(
      {required final DateTime paidAt,
      required final double amountPaid,
      required final String paymentMethod}) = _$PaymentRecordImpl;

  @override
  DateTime get paidAt;
  @override
  double get amountPaid;
  @override
  String get paymentMethod;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRecordImplCopyWith<_$PaymentRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Invoice {
  int get id => throw _privateConstructorUsedError;
  int get rentalContractId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  InvoiceStatus get status => throw _privateConstructorUsedError;
  PixCharge? get pixCharge => throw _privateConstructorUsedError;
  LateFee? get lateFee => throw _privateConstructorUsedError;
  PaymentRecord? get payment => throw _privateConstructorUsedError;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {int id,
      int rentalContractId,
      String description,
      DateTime dueDate,
      double amount,
      InvoiceStatus status,
      PixCharge? pixCharge,
      LateFee? lateFee,
      PaymentRecord? payment});

  $PixChargeCopyWith<$Res>? get pixCharge;
  $LateFeeCopyWith<$Res>? get lateFee;
  $PaymentRecordCopyWith<$Res>? get payment;
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rentalContractId = null,
    Object? description = null,
    Object? dueDate = null,
    Object? amount = null,
    Object? status = null,
    Object? pixCharge = freezed,
    Object? lateFee = freezed,
    Object? payment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rentalContractId: null == rentalContractId
          ? _value.rentalContractId
          : rentalContractId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvoiceStatus,
      pixCharge: freezed == pixCharge
          ? _value.pixCharge
          : pixCharge // ignore: cast_nullable_to_non_nullable
              as PixCharge?,
      lateFee: freezed == lateFee
          ? _value.lateFee
          : lateFee // ignore: cast_nullable_to_non_nullable
              as LateFee?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentRecord?,
    ) as $Val);
  }

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PixChargeCopyWith<$Res>? get pixCharge {
    if (_value.pixCharge == null) {
      return null;
    }

    return $PixChargeCopyWith<$Res>(_value.pixCharge!, (value) {
      return _then(_value.copyWith(pixCharge: value) as $Val);
    });
  }

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LateFeeCopyWith<$Res>? get lateFee {
    if (_value.lateFee == null) {
      return null;
    }

    return $LateFeeCopyWith<$Res>(_value.lateFee!, (value) {
      return _then(_value.copyWith(lateFee: value) as $Val);
    });
  }

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRecordCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentRecordCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int rentalContractId,
      String description,
      DateTime dueDate,
      double amount,
      InvoiceStatus status,
      PixCharge? pixCharge,
      LateFee? lateFee,
      PaymentRecord? payment});

  @override
  $PixChargeCopyWith<$Res>? get pixCharge;
  @override
  $LateFeeCopyWith<$Res>? get lateFee;
  @override
  $PaymentRecordCopyWith<$Res>? get payment;
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rentalContractId = null,
    Object? description = null,
    Object? dueDate = null,
    Object? amount = null,
    Object? status = null,
    Object? pixCharge = freezed,
    Object? lateFee = freezed,
    Object? payment = freezed,
  }) {
    return _then(_$InvoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rentalContractId: null == rentalContractId
          ? _value.rentalContractId
          : rentalContractId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvoiceStatus,
      pixCharge: freezed == pixCharge
          ? _value.pixCharge
          : pixCharge // ignore: cast_nullable_to_non_nullable
              as PixCharge?,
      lateFee: freezed == lateFee
          ? _value.lateFee
          : lateFee // ignore: cast_nullable_to_non_nullable
              as LateFee?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentRecord?,
    ));
  }
}

/// @nodoc

class _$InvoiceImpl extends _Invoice {
  const _$InvoiceImpl(
      {required this.id,
      required this.rentalContractId,
      required this.description,
      required this.dueDate,
      required this.amount,
      required this.status,
      this.pixCharge,
      this.lateFee,
      this.payment})
      : super._();

  @override
  final int id;
  @override
  final int rentalContractId;
  @override
  final String description;
  @override
  final DateTime dueDate;
  @override
  final double amount;
  @override
  final InvoiceStatus status;
  @override
  final PixCharge? pixCharge;
  @override
  final LateFee? lateFee;
  @override
  final PaymentRecord? payment;

  @override
  String toString() {
    return 'Invoice(id: $id, rentalContractId: $rentalContractId, description: $description, dueDate: $dueDate, amount: $amount, status: $status, pixCharge: $pixCharge, lateFee: $lateFee, payment: $payment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rentalContractId, rentalContractId) ||
                other.rentalContractId == rentalContractId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pixCharge, pixCharge) ||
                other.pixCharge == pixCharge) &&
            (identical(other.lateFee, lateFee) || other.lateFee == lateFee) &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, rentalContractId,
      description, dueDate, amount, status, pixCharge, lateFee, payment);

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);
}

abstract class _Invoice extends Invoice {
  const factory _Invoice(
      {required final int id,
      required final int rentalContractId,
      required final String description,
      required final DateTime dueDate,
      required final double amount,
      required final InvoiceStatus status,
      final PixCharge? pixCharge,
      final LateFee? lateFee,
      final PaymentRecord? payment}) = _$InvoiceImpl;
  const _Invoice._() : super._();

  @override
  int get id;
  @override
  int get rentalContractId;
  @override
  String get description;
  @override
  DateTime get dueDate;
  @override
  double get amount;
  @override
  InvoiceStatus get status;
  @override
  PixCharge? get pixCharge;
  @override
  LateFee? get lateFee;
  @override
  PaymentRecord? get payment;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
