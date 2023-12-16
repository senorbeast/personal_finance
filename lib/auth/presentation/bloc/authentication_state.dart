part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
}

enum AuthStep { login, signup, confirmationCode }

class ToastifyModel {
  final String title;
  final String description;

  const ToastifyModel({
    required this.title,
    required this.description,
  });

  factory ToastifyModel.defaultState() {
    return const ToastifyModel(title: "", description: "");
  }
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final String username;
  final String email;
  final AuthStep authStep;
  final AuthUser? authUser;
  final ToastifyModel toastifyModel;

  const AuthenticationState({
    required this.status,
    required this.username,
    required this.authUser,
    required this.email,
    required this.authStep,
    required this.toastifyModel,
  });

  // Factory method for a default AuthenticationState
  factory AuthenticationState.defaultState() {
    return AuthenticationState(
      status: AuthenticationStatus.unauthenticated,
      username: '',
      email: '',
      authStep: AuthStep.signup,
      authUser: null,
      toastifyModel: ToastifyModel.defaultState(),
    );
  }

  @override
  List<Object?> get props => [
        status,
        username,
        email,
        authStep,
        authUser,
        toastifyModel,
      ];

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    String? username,
    String? email,
    AuthStep? authStep,
    ToastifyModel? toastifyModel,
    AuthUser? authUser,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      email: email ?? this.email,
      username: username ?? this.username,
      authStep: authStep ?? this.authStep,
      authUser: authUser ?? this.authUser,
      toastifyModel: toastifyModel ?? this.toastifyModel,
    );
  }
}
