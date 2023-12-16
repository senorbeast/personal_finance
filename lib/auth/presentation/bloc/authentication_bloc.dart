// authentication_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.defaultState()) {
    on<SignUpUser>(_onSignUpUser);
    on<LogInUser>(_onSignInUser);
    on<ChangeLoginSignUp>(_onChangedLoginOrSignUp);
  }

  void _onSignUpUser(
      SignUpUser event, Emitter<AuthenticationState> emit) async {
    try {
      // TODO: Use your authentication use case or repository to sign up the user
      // For example:
      // final user = await authenticationUseCase.signUp(event.email, event.password);

      // Assuming user creation was successful, emit a new state with authenticated status
      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
        username: "FROM AWS",
        email: event.email,
      ));
    } catch (e) {
      // Handle sign-up failure, emit an unauthenticated state or show an error
      emit(AuthenticationState.defaultState());
    }
  }

  void _onSignInUser(LogInUser event, Emitter<AuthenticationState> emit) async {
    try {
      // TODO: Use your authentication use case or repository to sign in the user
      // For example:
      // final user = await authenticationUseCase.signIn(event.email, event.password);

      // Assuming sign-in was successful, emit a new state with authenticated status
      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
        username: "FROM AWS",
        email: event.email,
      ));
    } catch (e) {
      // Handle sign-in failure, emit an unauthenticated state or show an error
      emit(AuthenticationState.defaultState());
    }
  }

  void _onChangedLoginOrSignUp(
      ChangeLoginSignUp event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      loginOrSignUp: event.loginOrSignUp,
    ));
  }
}
