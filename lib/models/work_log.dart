import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_trackify/models/work_break.dart';
import 'package:time_trackify/models/work_event.dart';

part 'work_log.freezed.dart';
part 'work_log.g.dart';

@freezed
class WorkLog with _$WorkLog {
  const factory WorkLog({
    List<WorkBreak>? breaks,
    WorkEvent? endWork,
    WorkEvent? startWork,
  }) = _WorkLog;

  factory WorkLog.fromJson(Map<String, dynamic> json) =>
      _$WorkLogFromJson(json);
}
