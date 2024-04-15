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

  QrState({
    this.userData,
    this.currentQrStep = QrStep.pure,
    this.isLoading = true,
    this.barcode,
    this.qrCodes,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        userData,
        currentQrStep,
        isLoading,
        barcode,
        qrCodes,
        errorMessage,
      ];
}
