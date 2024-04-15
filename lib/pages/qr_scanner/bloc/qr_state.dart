part of 'qr_bloc.dart';

enum QrStep {
  pure,
  scan,
  summary,
}

@CopyWith()
class QrState with EquatableMixin {
  final QrStep currentQrStep;
  final UserData? userData;
  final bool isLoading;
  final String? barcode;
  final List<QrCodes>? qrCodes;
  final String? errorMessage;
  final bool isCameraAllowed;

  QrState({
    this.userData,
    this.currentQrStep = QrStep.pure,
    this.isLoading = true,
    this.barcode,
    this.qrCodes,
    this.errorMessage,
    this.isCameraAllowed = false,
  });

  @override
  List<Object?> get props => [
        userData,
        currentQrStep,
        isLoading,
        barcode,
        qrCodes,
        errorMessage,
        isCameraAllowed,
      ];
}
