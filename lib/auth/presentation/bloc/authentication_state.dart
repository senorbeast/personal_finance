part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
}

enum LoginOrSignUp { login, signup }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final String username;
  final String email;
  final LoginOrSignUp loginOrSignUp;

  const AuthenticationState({
    required this.status,
    required this.username,
    required this.email,
    required this.loginOrSignUp,
  });

  // Factory method for a default AuthenticationState
  factory AuthenticationState.defaultState() {
    return const AuthenticationState(
      status: AuthenticationStatus.unauthenticated,
      username: '',
      email: '',
      loginOrSignUp: LoginOrSignUp.signup,
    );
  }

  @override
  List<Object> get props => [
        status,
        username,
        email,
        loginOrSignUp,
      ];

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    String? username,
    String? email,
    LoginOrSignUp? loginOrSignUp,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      email: email ?? this.email,
      username: username ?? this.username,
      loginOrSignUp: loginOrSignUp ?? this.loginOrSignUp,
    );
  }
}
