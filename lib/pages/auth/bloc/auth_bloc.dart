import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_trackify/base_cubit.dart';
import 'package:time_trackify/exceptions/exceptions.dart';
import 'package:time_trackify/models/current_user.dart';
import 'package:time_trackify/pages/profile/bloc/profile_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';
import 'package:time_trackify/services/firebase_auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/services/firestore_service.dart';

part 'auth_state.dart';
part 'auth_bloc.g.dart';

/// AuthBloc is responsible for managing authorization in the application
class AuthBloc extends BaseCubit<AuthState> {
  late final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  late final FirestoreService _firestoreService = FirestoreService();

  AuthBloc(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          AuthState(),
        );

  Future<void> login(String email, String password) async {
    emit(
      state.copyWith(
        errorMessage: '',
        isLoading: true,
      ),
    );

    try {
      final CurrentUser? user = await _firebaseAuthService
          .signInWithEmailAndPassword(email, password);

      if (user != null) {
        emit(state.copyWith(isLoading: false));
      } else {
        emit(state.copyWith(
          errorMessage: 'Nie poprawne dane',
          isLoading: false,
        ));
      }
    } on InternalCredentialsError {
      emit(state.copyWith(
        errorMessage: 'Nie poprawne dane',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Błąd',
        isLoading: false,
      ));
    }
  }

  Future<void> register(String email, String password) async {
    emit(
      state.copyWith(
        errorMessage: '',
        isLoading: true,
      ),
    );

    try {
      final CurrentUser? user = await _firebaseAuthService
          .signUpWithEmailAndPassword(email, password);
      if (user != null) {
        emit(state.copyWith(isLoading: false));

        await _firestoreService.updateUser(user.userId);
        _navigateToAuthenticationFlowScreen();
      } else {
        emit(state.copyWith(
          errorMessage: 'Nie poprawne dane',
          isLoading: false,
        ));
      }
    } on UserAlreadyExistsError {
      emit(state.copyWith(
        errorMessage: 'Użytkownik już istnieje',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Błąd',
        isLoading: false,
      ));
    }
  }

  Future<void> logOutWithContext(BuildContext context) async {
    emit(
      state.copyWith(
        errorMessage: '',
        isLoading: true,
      ),
    );
    context.read<QrBloc>().clearQrBlocState();
    context.read<ProfileBloc>().clearProfileBlocState();
    _clearState();

    await logOut();

    _navigateToAuthenticationFlowScreen();
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuthService.signOutUser();
    } on DefaultException {
      emit(state.copyWith(
        errorMessage: 'Błąd Firebase',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Błąd',
        isLoading: false,
      ));
    }
  }

  void navigateToLoginPage() {
    _clearState();
    appRouter.replaceAll([LoginRoute()]);
  }

  void navigateToRegisterPage() {
    _clearState();
    appRouter.navigate(RegistrationRoute());
  }

  void _navigateToAuthenticationFlowScreen() {
    appRouter.navigate(const AuthenticationFlowRoute());
  }

  void _clearState() {
    emit(
      state.copyWith(
        errorMessage: '',
        isLoading: false,
        currentUser: null,
      ),
    );
  }
}
