import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:time_trackify/base_cubit.dart';
import 'package:time_trackify/exceptions/exceptions.dart';
import 'package:time_trackify/models/qr_codes.dart';
import 'package:time_trackify/models/user_data.dart';
import 'package:flutter/widgets.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/services/firestore_service.dart';

part 'qr_state.dart';
part 'qr_bloc.g.dart';

class QrBloc extends BaseCubit<QrState> {
  late final FirestoreService firestoreService = FirestoreService();

  QrBloc(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          QrState(),
        ) {
    _getData();
  }

  Future<void> _getData() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      UserData userData = await firestoreService.getUser(user?.uid);

      List<QrCodes> qrCodes = await firestoreService.getQrCodes();

      emit(state.copyWith(
        userData: userData,
        qrCodes: qrCodes,
        isLoading: false,
      ));
    } on DocumentIdNotExist {
      emit(state.copyWith(
        errorMessage: 'Dokument o takim id nie istnieje',
        isLoading: false,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        errorMessage: 'Błąd z cloud firestore',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Wystąpił błąd podczas pobierania danych',
        isLoading: false,
      ));
    }
  }

  void setBarcode(String? barcode) {
    emit(state.copyWith(
      barcode: barcode,
      currentQrStep: QrStep.summary,
    ));
  }

  void confirmQr() async {
    try {
      emit(state.copyWith(isLoading: true));

      QrCodes? scannedQrCode = state.qrCodes?.firstWhere(
        (qrCodeElement) => qrCodeElement.qrCode == state.barcode,
        orElse: () => const QrCodes(
          description: '',
          gate: '',
          qrCode: '',
          sector: '',
          workstation: '',
          status: '',
        ),
      );

      // if we not find equal qr code(from datase) to scanned
      if (scannedQrCode?.qrCode.isEmpty ?? true) {
        emit(state.copyWith(
          errorMessage: 'Nie znaleziono takiego kodu QR',
          currentQrStep: QrStep.pure,
          isLoading: false,
          barcode: null,
        ));
        return;
      }

      User? user = FirebaseAuth.instance.currentUser;

      await firestoreService.updateUser(user!.uid,
          status: scannedQrCode!.status);

      emit(state.copyWith(
        userData: state.userData?.copyWith(status: scannedQrCode.status),
        isLoading: false,
      ));

      setStepQrPure();
    } on FirestoreException {
      emit(state.copyWith(
        errorMessage: 'Błąd z cloud firestore',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Wystąpił błąd podczas zatwierdzania kodu QR',
        isLoading: false,
      ));
    }
  }

  void setStepQrScan() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      emit(state.copyWith(
        currentQrStep: QrStep.scan,
        isCameraAllowed: true,
      ));
      return;
    }

    if (status.isDenied) {
      const permission = Permission.camera;
      await permission.request();

      var updatedStatus = await permission.status;

      if (updatedStatus.isGranted) {
        emit(state.copyWith(
          currentQrStep: QrStep.scan,
          isCameraAllowed: true,
        ));
        return;
      } else {
        emit(state.copyWith(
          currentQrStep: QrStep.pure,
          errorMessage: 'Brak uprawnień',
          isCameraAllowed: false,
        ));
        return;
      }
    }

    if (await Permission.camera.isPermanentlyDenied) {
      emit(state.copyWith(
        errorMessage: 'Brak uprawnień',
        isCameraAllowed: false,
      ));
      openAppSettings();
      return;
    }
  }

  void setStepQrPure() {
    emit(state.copyWith(
      currentQrStep: QrStep.pure,
      barcode: null,
    ));
  }
}
