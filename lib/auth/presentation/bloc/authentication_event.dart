part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String username;
  final String password;

  const SignUpUser(this.email, this.username, this.password);

  @override
  List<Object> get props => [email, username, password];
}

class LogInUser extends AuthenticationEvent {
  final String username;
  final String password;

  const LogInUser(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class ChangeAuthStep extends AuthenticationEvent {
  final AuthStep authStep;

  const ChangeAuthStep(this.authStep);

  @override
  List<Object> get props => [authStep];
}

class EnterConfirmationCode extends AuthenticationEvent {
  final String confirmationCode;

  const EnterConfirmationCode(this.confirmationCode);

  @override
  List<Object> get props => [confirmationCode];
}

class GetCurrentUser extends AuthenticationEvent {
  const GetCurrentUser();
}

class SignOut extends AuthenticationEvent {}
