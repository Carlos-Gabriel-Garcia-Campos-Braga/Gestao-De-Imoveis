// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InspectionReport {
  int get id => throw _privateConstructorUsedError;
  int get propertyId => throw _privateConstructorUsedError;
  InspectionType get type => throw _privateConstructorUsedError;
  String get inspector => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get inspectedAt => throw _privateConstructorUsedError;

  /// Create a copy of InspectionReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InspectionReportCopyWith<InspectionReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionReportCopyWith<$Res> {
  factory $InspectionReportCopyWith(
          InspectionReport value, $Res Function(InspectionReport) then) =
      _$InspectionReportCopyWithImpl<$Res, InspectionReport>;
  @useResult
  $Res call(
      {int id,
      int propertyId,
      InspectionType type,
      String inspector,
      String? notes,
      DateTime inspectedAt});
}

/// @nodoc
class _$InspectionReportCopyWithImpl<$Res, $Val extends InspectionReport>
    implements $InspectionReportCopyWith<$Res> {
  _$InspectionReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InspectionReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? type = null,
    Object? inspector = null,
    Object? notes = freezed,
    Object? inspectedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InspectionType,
      inspector: null == inspector
          ? _value.inspector
          : inspector // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      inspectedAt: null == inspectedAt
          ? _value.inspectedAt
          : inspectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InspectionReportImplCopyWith<$Res>
    implements $InspectionReportCopyWith<$Res> {
  factory _$$InspectionReportImplCopyWith(_$InspectionReportImpl value,
          $Res Function(_$InspectionReportImpl) then) =
      __$$InspectionReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int propertyId,
      InspectionType type,
      String inspector,
      String? notes,
      DateTime inspectedAt});
}

/// @nodoc
class __$$InspectionReportImplCopyWithImpl<$Res>
    extends _$InspectionReportCopyWithImpl<$Res, _$InspectionReportImpl>
    implements _$$InspectionReportImplCopyWith<$Res> {
  __$$InspectionReportImplCopyWithImpl(_$InspectionReportImpl _value,
      $Res Function(_$InspectionReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of InspectionReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? type = null,
    Object? inspector = null,
    Object? notes = freezed,
    Object? inspectedAt = null,
  }) {
    return _then(_$InspectionReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InspectionType,
      inspector: null == inspector
          ? _value.inspector
          : inspector // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      inspectedAt: null == inspectedAt
          ? _value.inspectedAt
          : inspectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$InspectionReportImpl implements _InspectionReport {
  const _$InspectionReportImpl(
      {required this.id,
      required this.propertyId,
      required this.type,
      required this.inspector,
      this.notes,
      required this.inspectedAt});

  @override
  final int id;
  @override
  final int propertyId;
  @override
  final InspectionType type;
  @override
  final String inspector;
  @override
  final String? notes;
  @override
  final DateTime inspectedAt;

  @override
  String toString() {
    return 'InspectionReport(id: $id, propertyId: $propertyId, type: $type, inspector: $inspector, notes: $notes, inspectedAt: $inspectedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.inspector, inspector) ||
                other.inspector == inspector) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.inspectedAt, inspectedAt) ||
                other.inspectedAt == inspectedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, propertyId, type, inspector, notes, inspectedAt);

  /// Create a copy of InspectionReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionReportImplCopyWith<_$InspectionReportImpl> get copyWith =>
      __$$InspectionReportImplCopyWithImpl<_$InspectionReportImpl>(
          this, _$identity);
}

abstract class _InspectionReport implements InspectionReport {
  const factory _InspectionReport(
      {required final int id,
      required final int propertyId,
      required final InspectionType type,
      required final String inspector,
      final String? notes,
      required final DateTime inspectedAt}) = _$InspectionReportImpl;

  @override
  int get id;
  @override
  int get propertyId;
  @override
  InspectionType get type;
  @override
  String get inspector;
  @override
  String? get notes;
  @override
  DateTime get inspectedAt;

  /// Create a copy of InspectionReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InspectionReportImplCopyWith<_$InspectionReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
