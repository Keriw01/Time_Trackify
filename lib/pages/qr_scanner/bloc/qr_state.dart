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

  QrState({
    this.userData,
    this.currentQrStep = QrStep.pure,
    this.isLoading = true,
    this.barcode,
  });

  @override
  List<Object?> get props => [
        userData,
        currentQrStep,
        isLoading,
        barcode,
      ];
}
