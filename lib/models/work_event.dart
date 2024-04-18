import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_event.g.dart';

@JsonSerializable()
class WorkEvent {
  String qrCode;
  DateTime time;

  WorkEvent({
    required this.qrCode,
    required this.time,
  });

  factory WorkEvent.fromJson(Map<String, dynamic> json) =>
      _$WorkEventFromJson(json);

  Map<String, dynamic> toJson() => _$WorkEventToJson(this);
}
