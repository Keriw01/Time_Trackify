import 'package:json_annotation/json_annotation.dart';

part 'work_break.g.dart';

@JsonSerializable()
class WorkBreak {
  String qrCode;
  DateTime? startTime;
  DateTime? endTime;

  WorkBreak({
    required this.qrCode,
    this.startTime,
    this.endTime,
  });

  factory WorkBreak.fromJson(Map<String, dynamic> json) =>
      _$WorkBreakFromJson(json);

  Map<String, dynamic> toJson() => _$WorkBreakToJson(this);
}
