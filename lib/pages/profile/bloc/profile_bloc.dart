import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_trackify/base_cubit.dart';
import 'package:time_trackify/exceptions/exceptions.dart';
import 'package:time_trackify/models/user_data.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/services/firestore_service.dart';

part 'profile_state.dart';
part 'profile_bloc.g.dart';

class ProfileBloc extends BaseCubit<ProfileState> {
  late final FirestoreService firestoreService = FirestoreService();

  ProfileBloc(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          ProfileState(),
        ) {
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      UserData userData = await firestoreService.getUser(user?.uid);

      emit(state.copyWith(
        userData: userData,
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
        errorMessage: 'Wystąpił błąd podczas pobierania danych o użytkowniku',
        isLoading: false,
      ));
    }
  }
}
