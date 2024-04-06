part of 'auth_bloc.dart';

@CopyWith()
class AuthState with EquatableMixin {
  final String errorMessage;
  final bool isLoading;
  final bool isLoggedIn;
  final CurrentUser? currentUser;

  AuthState({
    this.isLoading = false,
    this.errorMessage = '',
    this.isLoggedIn = false,
    this.currentUser,
  });

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        isLoggedIn,
        currentUser,
      ];
}
