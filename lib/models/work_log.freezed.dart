// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkLog _$WorkLogFromJson(Map<String, dynamic> json) {
  return _WorkLog.fromJson(json);
}

/// @nodoc
mixin _$WorkLog {
  List<WorkBreak>? get breaks => throw _privateConstructorUsedError;
  WorkEvent? get endWork => throw _privateConstructorUsedError;
  WorkEvent? get startWork => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkLogCopyWith<WorkLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkLogCopyWith<$Res> {
  factory $WorkLogCopyWith(WorkLog value, $Res Function(WorkLog) then) =
      _$WorkLogCopyWithImpl<$Res, WorkLog>;
  @useResult
  $Res call(
      {List<WorkBreak>? breaks, WorkEvent? endWork, WorkEvent? startWork});
}

/// @nodoc
class _$WorkLogCopyWithImpl<$Res, $Val extends WorkLog>
    implements $WorkLogCopyWith<$Res> {
  _$WorkLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breaks = freezed,
    Object? endWork = freezed,
    Object? startWork = freezed,
  }) {
    return _then(_value.copyWith(
      breaks: freezed == breaks
          ? _value.breaks
          : breaks // ignore: cast_nullable_to_non_nullable
              as List<WorkBreak>?,
      endWork: freezed == endWork
          ? _value.endWork
          : endWork // ignore: cast_nullable_to_non_nullable
              as WorkEvent?,
      startWork: freezed == startWork
          ? _value.startWork
          : startWork // ignore: cast_nullable_to_non_nullable
              as WorkEvent?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkLogImplCopyWith<$Res> implements $WorkLogCopyWith<$Res> {
  factory _$$WorkLogImplCopyWith(
          _$WorkLogImpl value, $Res Function(_$WorkLogImpl) then) =
      __$$WorkLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WorkBreak>? breaks, WorkEvent? endWork, WorkEvent? startWork});
}

/// @nodoc
class __$$WorkLogImplCopyWithImpl<$Res>
    extends _$WorkLogCopyWithImpl<$Res, _$WorkLogImpl>
    implements _$$WorkLogImplCopyWith<$Res> {
  __$$WorkLogImplCopyWithImpl(
      _$WorkLogImpl _value, $Res Function(_$WorkLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breaks = freezed,
    Object? endWork = freezed,
    Object? startWork = freezed,
  }) {
    return _then(_$WorkLogImpl(
      breaks: freezed == breaks
          ? _value._breaks
          : breaks // ignore: cast_nullable_to_non_nullable
              as List<WorkBreak>?,
      endWork: freezed == endWork
          ? _value.endWork
          : endWork // ignore: cast_nullable_to_non_nullable
              as WorkEvent?,
      startWork: freezed == startWork
          ? _value.startWork
          : startWork // ignore: cast_nullable_to_non_nullable
              as WorkEvent?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkLogImpl implements _WorkLog {
  const _$WorkLogImpl(
      {final List<WorkBreak>? breaks, this.endWork, this.startWork})
      : _breaks = breaks;

  factory _$WorkLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkLogImplFromJson(json);

  final List<WorkBreak>? _breaks;
  @override
  List<WorkBreak>? get breaks {
    final value = _breaks;
    if (value == null) return null;
    if (_breaks is EqualUnmodifiableListView) return _breaks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final WorkEvent? endWork;
  @override
  final WorkEvent? startWork;

  @override
  String toString() {
    return 'WorkLog(breaks: $breaks, endWork: $endWork, startWork: $startWork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkLogImpl &&
            const DeepCollectionEquality().equals(other._breaks, _breaks) &&
            (identical(other.endWork, endWork) || other.endWork == endWork) &&
            (identical(other.startWork, startWork) ||
                other.startWork == startWork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_breaks), endWork, startWork);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkLogImplCopyWith<_$WorkLogImpl> get copyWith =>
      __$$WorkLogImplCopyWithImpl<_$WorkLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkLogImplToJson(
      this,
    );
  }
}

abstract class _WorkLog implements WorkLog {
  const factory _WorkLog(
      {final List<WorkBreak>? breaks,
      final WorkEvent? endWork,
      final WorkEvent? startWork}) = _$WorkLogImpl;

  factory _WorkLog.fromJson(Map<String, dynamic> json) = _$WorkLogImpl.fromJson;

  @override
  List<WorkBreak>? get breaks;
  @override
  WorkEvent? get endWork;
  @override
  WorkEvent? get startWork;
  @override
  @JsonKey(ignore: true)
  _$$WorkLogImplCopyWith<_$WorkLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
