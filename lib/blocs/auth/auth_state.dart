part of 'auth_bloc.dart';

@CopyWith()
class AuthState with EquatableMixin {
  final String errorMessage;
  final bool isLoading;
  final CurrentUser? currentUser;

  AuthState({
    this.isLoading = false,
    this.errorMessage = '',
    this.currentUser,
  });

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        currentUser,
      ];
}
