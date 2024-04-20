import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_trackify/models/work_log.dart';

part 'work_logs.freezed.dart';
part 'work_logs.g.dart';

@freezed
class WorkLogs with _$WorkLogs {
  const factory WorkLogs({
    @JsonKey(name: 'Logs') List<WorkLog>? workLogs,
  }) = _WorkLogs;

  factory WorkLogs.fromJson(Map<String, dynamic> json) =>
      _$WorkLogsFromJson(json);
}
