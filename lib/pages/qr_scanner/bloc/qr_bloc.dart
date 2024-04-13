import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_trackify/base_cubit.dart';
import 'package:time_trackify/models/user_data.dart';
import 'package:flutter/widgets.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/services/firestore_service.dart';
import 'package:time_trackify/utils/converts.dart';

part 'qr_state.dart';
part 'qr_bloc.g.dart';

class QrBloc extends BaseCubit<QrState> {
  late final FirestoreService firestoreService = FirestoreService();

  QrBloc(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          QrState(),
        ) {
    getUserData();
  }

  Future<void> getUserData() async {
    /// TODO
    /// Obsłużyć błędy
    emit(state.copyWith(isLoading: true));
    User? user = FirebaseAuth.instance.currentUser;
    UserData userData = await firestoreService.getUser(user?.uid);
    emit(state.copyWith(
      userData: userData,
      isLoading: false,
    ));
  }

  void setBarcode(String? barcode) {
    emit(state.copyWith(
      barcode: barcode,
      currentQrStep: QrStep.summary,
    ));
  }

  void confirmQr() async {
    /// TODO
    /// Obsłużyć błędy
    String workerStatus = '';
    if (state.barcode == 'EA1') {
      workerStatus = 'working';
    } else if (state.barcode == 'BA1-1') {
      workerStatus = 'break';
    }
    emit(state.copyWith(isLoading: true));
    User? user = FirebaseAuth.instance.currentUser;
    await firestoreService.updateUser(user!.uid, status: workerStatus);
    String status = convertStringToUserStatus(workerStatus);

    emit(state.copyWith(
      userData: state.userData?.copyWith(status: status),
      isLoading: false,
    ));

    navigateToQrPage();
  }

  void setStepOne() {
    emit(state.copyWith(currentQrStep: QrStep.scan));
  }

  void navigateToQrPage() {
    emit(state.copyWith(
      currentQrStep: QrStep.pure,
      barcode: null,
    ));
  }
}
