part of 'statistics_bloc.dart';

@CopyWith()
class StatisticsState with EquatableMixin {
  final String? errorMessage;
  final bool isLoading;
  final WorkLogs? workLogs;
  final List<Map<String, dynamic>>? chartData;

  StatisticsState({
    this.isLoading = false,
    this.errorMessage,
    this.workLogs,
    this.chartData,
  });

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        workLogs,
        chartData,
      ];
}
