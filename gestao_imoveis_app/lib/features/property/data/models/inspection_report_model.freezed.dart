// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InspectionReportModel _$InspectionReportModelFromJson(
    Map<String, dynamic> json) {
  return _InspectionReportModel.fromJson(json);
}

/// @nodoc
mixin _$InspectionReportModel {
  int get id => throw _privateConstructorUsedError;
  int get propertyId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get inspector => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get inspectedAt => throw _privateConstructorUsedError;

  /// Serializes this InspectionReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InspectionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InspectionReportModelCopyWith<InspectionReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionReportModelCopyWith<$Res> {
  factory $InspectionReportModelCopyWith(InspectionReportModel value,
          $Res Function(InspectionReportModel) then) =
      _$InspectionReportModelCopyWithImpl<$Res, InspectionReportModel>;
  @useResult
  $Res call(
      {int id,
      int propertyId,
      String type,
      String inspector,
      String? notes,
      DateTime inspectedAt});
}

/// @nodoc
class _$InspectionReportModelCopyWithImpl<$Res,
        $Val extends InspectionReportModel>
    implements $InspectionReportModelCopyWith<$Res> {
  _$InspectionReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InspectionReportModel
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
              as String,
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
abstract class _$$InspectionReportModelImplCopyWith<$Res>
    implements $InspectionReportModelCopyWith<$Res> {
  factory _$$InspectionReportModelImplCopyWith(
          _$InspectionReportModelImpl value,
          $Res Function(_$InspectionReportModelImpl) then) =
      __$$InspectionReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int propertyId,
      String type,
      String inspector,
      String? notes,
      DateTime inspectedAt});
}

/// @nodoc
class __$$InspectionReportModelImplCopyWithImpl<$Res>
    extends _$InspectionReportModelCopyWithImpl<$Res,
        _$InspectionReportModelImpl>
    implements _$$InspectionReportModelImplCopyWith<$Res> {
  __$$InspectionReportModelImplCopyWithImpl(_$InspectionReportModelImpl _value,
      $Res Function(_$InspectionReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InspectionReportModel
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
    return _then(_$InspectionReportModelImpl(
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
              as String,
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
@JsonSerializable()
class _$InspectionReportModelImpl implements _InspectionReportModel {
  const _$InspectionReportModelImpl(
      {required this.id,
      required this.propertyId,
      required this.type,
      required this.inspector,
      this.notes,
      required this.inspectedAt});

  factory _$InspectionReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectionReportModelImplFromJson(json);

  @override
  final int id;
  @override
  final int propertyId;
  @override
  final String type;
  @override
  final String inspector;
  @override
  final String? notes;
  @override
  final DateTime inspectedAt;

  @override
  String toString() {
    return 'InspectionReportModel(id: $id, propertyId: $propertyId, type: $type, inspector: $inspector, notes: $notes, inspectedAt: $inspectedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionReportModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, propertyId, type, inspector, notes, inspectedAt);

  /// Create a copy of InspectionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionReportModelImplCopyWith<_$InspectionReportModelImpl>
      get copyWith => __$$InspectionReportModelImplCopyWithImpl<
          _$InspectionReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectionReportModelImplToJson(
      this,
    );
  }
}

abstract class _InspectionReportModel implements InspectionReportModel {
  const factory _InspectionReportModel(
      {required final int id,
      required final int propertyId,
      required final String type,
      required final String inspector,
      final String? notes,
      required final DateTime inspectedAt}) = _$InspectionReportModelImpl;

  factory _InspectionReportModel.fromJson(Map<String, dynamic> json) =
      _$InspectionReportModelImpl.fromJson;

  @override
  int get id;
  @override
  int get propertyId;
  @override
  String get type;
  @override
  String get inspector;
  @override
  String? get notes;
  @override
  DateTime get inspectedAt;

  /// Create a copy of InspectionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InspectionReportModelImplCopyWith<_$InspectionReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
