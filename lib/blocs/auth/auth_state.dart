part of 'auth_bloc.dart';

@CopyWith()
class AuthState with EquatableMixin {
  final bool isLoading;
  String errorMessage;

  AuthState({
    this.isLoading = false,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
      ];
}
