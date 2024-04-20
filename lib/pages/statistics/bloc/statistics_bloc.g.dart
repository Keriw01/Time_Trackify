// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StatisticsStateCWProxy {
  StatisticsState isLoading(bool isLoading);

  StatisticsState errorMessage(String? errorMessage);

  StatisticsState workLogs(WorkLogs? workLogs);

  StatisticsState chartData(List<Map<String, dynamic>>? chartData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StatisticsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StatisticsState(...).copyWith(id: 12, name: "My name")
  /// ````
  StatisticsState call({
    bool? isLoading,
    String? errorMessage,
    WorkLogs? workLogs,
    List<Map<String, dynamic>>? chartData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStatisticsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStatisticsState.copyWith.fieldName(...)`
class _$StatisticsStateCWProxyImpl implements _$StatisticsStateCWProxy {
  const _$StatisticsStateCWProxyImpl(this._value);

  final StatisticsState _value;

  @override
  StatisticsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  StatisticsState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  StatisticsState workLogs(WorkLogs? workLogs) => this(workLogs: workLogs);

  @override
  StatisticsState chartData(List<Map<String, dynamic>>? chartData) =>
      this(chartData: chartData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StatisticsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StatisticsState(...).copyWith(id: 12, name: "My name")
  /// ````
  StatisticsState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? workLogs = const $CopyWithPlaceholder(),
    Object? chartData = const $CopyWithPlaceholder(),
  }) {
    return StatisticsState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      workLogs: workLogs == const $CopyWithPlaceholder()
          ? _value.workLogs
          // ignore: cast_nullable_to_non_nullable
          : workLogs as WorkLogs?,
      chartData: chartData == const $CopyWithPlaceholder()
          ? _value.chartData
          // ignore: cast_nullable_to_non_nullable
          : chartData as List<Map<String, dynamic>>?,
    );
  }
}

extension $StatisticsStateCopyWith on StatisticsState {
  /// Returns a callable class that can be used as follows: `instanceOfStatisticsState.copyWith(...)` or like so:`instanceOfStatisticsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StatisticsStateCWProxy get copyWith => _$StatisticsStateCWProxyImpl(this);
}
