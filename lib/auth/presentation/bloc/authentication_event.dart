part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogInUser extends AuthenticationEvent {
  final String email;
  final String password;

  const LogInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class ChangeLoginSignUp extends AuthenticationEvent {
  final LoginOrSignUp loginOrSignUp;

  const ChangeLoginSignUp(this.loginOrSignUp);

  @override
  List<Object> get props => [loginOrSignUp];
}

class SignOut extends AuthenticationEvent {}
