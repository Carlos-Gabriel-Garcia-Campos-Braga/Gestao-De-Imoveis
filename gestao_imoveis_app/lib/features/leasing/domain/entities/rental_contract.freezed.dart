// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentalContract {
  int get id => throw _privateConstructorUsedError;
  Renter get renter => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String? get complement => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  List<RentBill> get bills => throw _privateConstructorUsedError;
  DateTime get startContract => throw _privateConstructorUsedError;
  DateTime get endContract => throw _privateConstructorUsedError;
  double get rentalValue => throw _privateConstructorUsedError;
  EconomicIndex get preferredIndex => throw _privateConstructorUsedError;
  List<ReadjustmentRecord> get readjustmentHistory =>
      throw _privateConstructorUsedError;

  /// Create a copy of RentalContract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalContractCopyWith<RentalContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalContractCopyWith<$Res> {
  factory $RentalContractCopyWith(
          RentalContract value, $Res Function(RentalContract) then) =
      _$RentalContractCopyWithImpl<$Res, RentalContract>;
  @useResult
  $Res call(
      {int id,
      Renter renter,
      String street,
      String number,
      String? complement,
      String neighborhood,
      String city,
      String state,
      String zipCode,
      List<RentBill> bills,
      DateTime startContract,
      DateTime endContract,
      double rentalValue,
      EconomicIndex preferredIndex,
      List<ReadjustmentRecord> readjustmentHistory});

  $RenterCopyWith<$Res> get renter;
}

/// @nodoc
class _$RentalContractCopyWithImpl<$Res, $Val extends RentalContract>
    implements $RentalContractCopyWith<$Res> {
  _$RentalContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalContract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? renter = null,
    Object? street = null,
    Object? number = null,
    Object? complement = freezed,
    Object? neighborhood = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? bills = null,
    Object? startContract = null,
    Object? endContract = null,
    Object? rentalValue = null,
    Object? preferredIndex = null,
    Object? readjustmentHistory = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      renter: null == renter
          ? _value.renter
          : renter // ignore: cast_nullable_to_non_nullable
              as Renter,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<RentBill>,
      startContract: null == startContract
          ? _value.startContract
          : startContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endContract: null == endContract
          ? _value.endContract
          : endContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rentalValue: null == rentalValue
          ? _value.rentalValue
          : rentalValue // ignore: cast_nullable_to_non_nullable
              as double,
      preferredIndex: null == preferredIndex
          ? _value.preferredIndex
          : preferredIndex // ignore: cast_nullable_to_non_nullable
              as EconomicIndex,
      readjustmentHistory: null == readjustmentHistory
          ? _value.readjustmentHistory
          : readjustmentHistory // ignore: cast_nullable_to_non_nullable
              as List<ReadjustmentRecord>,
    ) as $Val);
  }

  /// Create a copy of RentalContract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RenterCopyWith<$Res> get renter {
    return $RenterCopyWith<$Res>(_value.renter, (value) {
      return _then(_value.copyWith(renter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentalContractImplCopyWith<$Res>
    implements $RentalContractCopyWith<$Res> {
  factory _$$RentalContractImplCopyWith(_$RentalContractImpl value,
          $Res Function(_$RentalContractImpl) then) =
      __$$RentalContractImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Renter renter,
      String street,
      String number,
      String? complement,
      String neighborhood,
      String city,
      String state,
      String zipCode,
      List<RentBill> bills,
      DateTime startContract,
      DateTime endContract,
      double rentalValue,
      EconomicIndex preferredIndex,
      List<ReadjustmentRecord> readjustmentHistory});

  @override
  $RenterCopyWith<$Res> get renter;
}

/// @nodoc
class __$$RentalContractImplCopyWithImpl<$Res>
    extends _$RentalContractCopyWithImpl<$Res, _$RentalContractImpl>
    implements _$$RentalContractImplCopyWith<$Res> {
  __$$RentalContractImplCopyWithImpl(
      _$RentalContractImpl _value, $Res Function(_$RentalContractImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalContract
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? renter = null,
    Object? street = null,
    Object? number = null,
    Object? complement = freezed,
    Object? neighborhood = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? bills = null,
    Object? startContract = null,
    Object? endContract = null,
    Object? rentalValue = null,
    Object? preferredIndex = null,
    Object? readjustmentHistory = null,
  }) {
    return _then(_$RentalContractImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      renter: null == renter
          ? _value.renter
          : renter // ignore: cast_nullable_to_non_nullable
              as Renter,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<RentBill>,
      startContract: null == startContract
          ? _value.startContract
          : startContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endContract: null == endContract
          ? _value.endContract
          : endContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rentalValue: null == rentalValue
          ? _value.rentalValue
          : rentalValue // ignore: cast_nullable_to_non_nullable
              as double,
      preferredIndex: null == preferredIndex
          ? _value.preferredIndex
          : preferredIndex // ignore: cast_nullable_to_non_nullable
              as EconomicIndex,
      readjustmentHistory: null == readjustmentHistory
          ? _value._readjustmentHistory
          : readjustmentHistory // ignore: cast_nullable_to_non_nullable
              as List<ReadjustmentRecord>,
    ));
  }
}

/// @nodoc

class _$RentalContractImpl extends _RentalContract {
  const _$RentalContractImpl(
      {required this.id,
      required this.renter,
      required this.street,
      required this.number,
      this.complement,
      required this.neighborhood,
      required this.city,
      required this.state,
      required this.zipCode,
      required final List<RentBill> bills,
      required this.startContract,
      required this.endContract,
      required this.rentalValue,
      required this.preferredIndex,
      required final List<ReadjustmentRecord> readjustmentHistory})
      : _bills = bills,
        _readjustmentHistory = readjustmentHistory,
        super._();

  @override
  final int id;
  @override
  final Renter renter;
  @override
  final String street;
  @override
  final String number;
  @override
  final String? complement;
  @override
  final String neighborhood;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zipCode;
  final List<RentBill> _bills;
  @override
  List<RentBill> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  @override
  final DateTime startContract;
  @override
  final DateTime endContract;
  @override
  final double rentalValue;
  @override
  final EconomicIndex preferredIndex;
  final List<ReadjustmentRecord> _readjustmentHistory;
  @override
  List<ReadjustmentRecord> get readjustmentHistory {
    if (_readjustmentHistory is EqualUnmodifiableListView)
      return _readjustmentHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readjustmentHistory);
  }

  @override
  String toString() {
    return 'RentalContract(id: $id, renter: $renter, street: $street, number: $number, complement: $complement, neighborhood: $neighborhood, city: $city, state: $state, zipCode: $zipCode, bills: $bills, startContract: $startContract, endContract: $endContract, rentalValue: $rentalValue, preferredIndex: $preferredIndex, readjustmentHistory: $readjustmentHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalContractImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.renter, renter) || other.renter == renter) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.complement, complement) ||
                other.complement == complement) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            const DeepCollectionEquality().equals(other._bills, _bills) &&
            (identical(other.startContract, startContract) ||
                other.startContract == startContract) &&
            (identical(other.endContract, endContract) ||
                other.endContract == endContract) &&
            (identical(other.rentalValue, rentalValue) ||
                other.rentalValue == rentalValue) &&
            (identical(other.preferredIndex, preferredIndex) ||
                other.preferredIndex == preferredIndex) &&
            const DeepCollectionEquality()
                .equals(other._readjustmentHistory, _readjustmentHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      renter,
      street,
      number,
      complement,
      neighborhood,
      city,
      state,
      zipCode,
      const DeepCollectionEquality().hash(_bills),
      startContract,
      endContract,
      rentalValue,
      preferredIndex,
      const DeepCollectionEquality().hash(_readjustmentHistory));

  /// Create a copy of RentalContract
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalContractImplCopyWith<_$RentalContractImpl> get copyWith =>
      __$$RentalContractImplCopyWithImpl<_$RentalContractImpl>(
          this, _$identity);
}

abstract class _RentalContract extends RentalContract {
  const factory _RentalContract(
          {required final int id,
          required final Renter renter,
          required final String street,
          required final String number,
          final String? complement,
          required final String neighborhood,
          required final String city,
          required final String state,
          required final String zipCode,
          required final List<RentBill> bills,
          required final DateTime startContract,
          required final DateTime endContract,
          required final double rentalValue,
          required final EconomicIndex preferredIndex,
          required final List<ReadjustmentRecord> readjustmentHistory}) =
      _$RentalContractImpl;
  const _RentalContract._() : super._();

  @override
  int get id;
  @override
  Renter get renter;
  @override
  String get street;
  @override
  String get number;
  @override
  String? get complement;
  @override
  String get neighborhood;
  @override
  String get city;
  @override
  String get state;
  @override
  String get zipCode;
  @override
  List<RentBill> get bills;
  @override
  DateTime get startContract;
  @override
  DateTime get endContract;
  @override
  double get rentalValue;
  @override
  EconomicIndex get preferredIndex;
  @override
  List<ReadjustmentRecord> get readjustmentHistory;

  /// Create a copy of RentalContract
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalContractImplCopyWith<_$RentalContractImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
