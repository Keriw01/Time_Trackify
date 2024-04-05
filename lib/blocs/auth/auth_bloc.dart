import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:time_trackify/blocs/base_cubit.dart';
import 'package:time_trackify/exceptions/auth_exceptions.dart';
import 'package:time_trackify/models/current_user.dart';
import 'package:time_trackify/repositories/firebase_auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:time_trackify/routes/app_router.dart';

part 'auth_state.dart';
part 'auth_bloc.g.dart';

/// AuthBloc is responsible for managing authorization in the application
class AuthBloc extends BaseCubit<AuthState> {
  late final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

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
        emit(state.copyWith(
          isLoading: false,
        ));
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
        emit(state.copyWith(
          isLoading: false,
        ));
        _navigateToAuthFlowScreen();
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

  Future<void> logOut() async {
    emit(
      state.copyWith(
        errorMessage: '',
        isLoading: true,
      ),
    );
    try {
      await _firebaseAuthService.signOutUser();
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    } finally {
      emit(state.copyWith(
        errorMessage: '',
        isLoading: false,
      ));
    }
  }

  void navigateToLoginPage() {
    _clearState();
    appRouter.replace(LoginRoute());
  }

  void navigateToRegisterPage() {
    _clearState();
    appRouter.replace(RegistrationRoute());
  }

  void _navigateToAuthFlowScreen() {
    appRouter.replace(const AuthenticationFlowRoute());
  }

  void _clearState() {
    emit(
      state.copyWith(
        errorMessage: '',
        isLoading: false,
      ),
    );
  }
}
