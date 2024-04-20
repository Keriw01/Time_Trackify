// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkLogs _$WorkLogsFromJson(Map<String, dynamic> json) {
  return _WorkLogs.fromJson(json);
}

/// @nodoc
mixin _$WorkLogs {
  @JsonKey(name: 'Logs')
  List<WorkLog>? get workLogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkLogsCopyWith<WorkLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkLogsCopyWith<$Res> {
  factory $WorkLogsCopyWith(WorkLogs value, $Res Function(WorkLogs) then) =
      _$WorkLogsCopyWithImpl<$Res, WorkLogs>;
  @useResult
  $Res call({@JsonKey(name: 'Logs') List<WorkLog>? workLogs});
}

/// @nodoc
class _$WorkLogsCopyWithImpl<$Res, $Val extends WorkLogs>
    implements $WorkLogsCopyWith<$Res> {
  _$WorkLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workLogs = freezed,
  }) {
    return _then(_value.copyWith(
      workLogs: freezed == workLogs
          ? _value.workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLog>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkLogsImplCopyWith<$Res>
    implements $WorkLogsCopyWith<$Res> {
  factory _$$WorkLogsImplCopyWith(
          _$WorkLogsImpl value, $Res Function(_$WorkLogsImpl) then) =
      __$$WorkLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Logs') List<WorkLog>? workLogs});
}

/// @nodoc
class __$$WorkLogsImplCopyWithImpl<$Res>
    extends _$WorkLogsCopyWithImpl<$Res, _$WorkLogsImpl>
    implements _$$WorkLogsImplCopyWith<$Res> {
  __$$WorkLogsImplCopyWithImpl(
      _$WorkLogsImpl _value, $Res Function(_$WorkLogsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workLogs = freezed,
  }) {
    return _then(_$WorkLogsImpl(
      workLogs: freezed == workLogs
          ? _value._workLogs
          : workLogs // ignore: cast_nullable_to_non_nullable
              as List<WorkLog>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkLogsImpl implements _WorkLogs {
  const _$WorkLogsImpl({@JsonKey(name: 'Logs') final List<WorkLog>? workLogs})
      : _workLogs = workLogs;

  factory _$WorkLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkLogsImplFromJson(json);

  final List<WorkLog>? _workLogs;
  @override
  @JsonKey(name: 'Logs')
  List<WorkLog>? get workLogs {
    final value = _workLogs;
    if (value == null) return null;
    if (_workLogs is EqualUnmodifiableListView) return _workLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkLogs(workLogs: $workLogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkLogsImpl &&
            const DeepCollectionEquality().equals(other._workLogs, _workLogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_workLogs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkLogsImplCopyWith<_$WorkLogsImpl> get copyWith =>
      __$$WorkLogsImplCopyWithImpl<_$WorkLogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkLogsImplToJson(
      this,
    );
  }
}

abstract class _WorkLogs implements WorkLogs {
  const factory _WorkLogs(
      {@JsonKey(name: 'Logs') final List<WorkLog>? workLogs}) = _$WorkLogsImpl;

  factory _WorkLogs.fromJson(Map<String, dynamic> json) =
      _$WorkLogsImpl.fromJson;

  @override
  @JsonKey(name: 'Logs')
  List<WorkLog>? get workLogs;
  @override
  @JsonKey(ignore: true)
  _$$WorkLogsImplCopyWith<_$WorkLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
