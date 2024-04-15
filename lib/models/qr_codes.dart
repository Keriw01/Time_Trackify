import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_codes.freezed.dart';
part 'qr_codes.g.dart';

@freezed
class QrCodes with _$QrCodes {
  const factory QrCodes({
    required String description,
    required String gate,
    required String qrCode,
    required String sector,
    required String? workstation,
    required String status,
  }) = _QrCodes;

  factory QrCodes.fromJson(Map<String, dynamic> json) =>
      _$QrCodesFromJson(json);
}
