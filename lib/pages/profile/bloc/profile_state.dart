part of 'profile_bloc.dart';

@CopyWith()
class ProfileState with EquatableMixin {
  final String? errorMessage;
  final bool isLoading;
  final UserData? userData;

  ProfileState({
    this.isLoading = false,
    this.errorMessage,
    this.userData,
  });

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        userData,
      ];
}
