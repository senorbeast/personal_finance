part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final String username;
  final String email;

  const AuthenticationState._({
    required this.status,
    required this.username,
    required this.email,
  });

  // Factory method for a default AuthenticationState
  factory AuthenticationState.defaultState() {
    return const AuthenticationState._(
      status: AuthenticationStatus.unauthenticated,
      username: '',
      email: '',
    );
  }

  @override
  List<Object> get props => [status, username, email];
}
