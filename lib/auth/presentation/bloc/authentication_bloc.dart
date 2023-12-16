// authentication_bloc.dart
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_finance/auth/domain/usecases/auth_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUseCase _authenticationUseCase; // Inject the use case

  AuthenticationBloc(this._authenticationUseCase)
      : super(AuthenticationState.defaultState()) {
    on<SignUpUser>(_onSignUpUser);
    on<LogInUser>(_onSignInUser);
    on<ChangeAuthStep>(_onChangeAuthStep);
    on<EnterConfirmationCode>(_onEnterConfirmationCode);
  }

  void _onSignUpUser(
      SignUpUser event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(
        status: AuthenticationStatus.loading,
        username: event.username,
        email: event.email,
      ));
      // Use the authentication use case to sign up the user
      final AuthResult result = await _authenticationUseCase.signUp(
        username: event.username,
        password: event.password,
        email: event.email,
      );

      ToastifyModel toastifyModel;
      if (result.value.runtimeType == AuthSignUpStep) {
        toastifyModel = _handleSignUpResult(result.value as AuthSignUpStep);
      } else {
        toastifyModel =
            ToastifyModel(title: "Error", description: result.value.toString());
      }

      emit(state.copyWith(
        status: AuthenticationStatus.unauthenticated,
        username: event.username,
        authStep: AuthStep.confirmationCode,
        email: event.email,
        toastifyModel: toastifyModel,
      ));
    } catch (e) {
      // Handle sign-up failure, emit an unauthenticated state or show an error
      emit(AuthenticationState.defaultState());
    }
  }

  void _onSignInUser(LogInUser event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(
        status: AuthenticationStatus.loading,
        username: event.username,
      ));

      // Use the authentication use case to sign in the user
      final AuthResult result = await _authenticationUseCase.signIn(
        username: event.username,
        password: event.password,
      );

      ToastifyModel toastifyModel;
      if (result.value.runtimeType == AuthSignInStep) {
        toastifyModel = _handleSignInResult(result.value as AuthSignInStep);
      } else {
        toastifyModel =
            ToastifyModel(title: "Error", description: result.value.toString());
      }

      // Assuming sign-in was successful, emit a new state with authenticated status
      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
        username: event.username,
        toastifyModel: toastifyModel,
      ));
    } catch (e) {
      // Handle sign-in failure, emit an unauthenticated state or show an error
      emit(AuthenticationState.defaultState());
    }
  }

  void _onChangeAuthStep(
      ChangeAuthStep event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(
      authStep: event.authStep,
    ));
  }

  void _onEnterConfirmationCode(
      EnterConfirmationCode event, Emitter<AuthenticationState> emit) async {
    try {
      final result = await _authenticationUseCase.confirmSignUp(
        username: state.username,
        confirmationCode: event.confirmationCode,
      );

      ToastifyModel toastifyModel;
      if (result.value.runtimeType == AuthSignUpStep) {
        toastifyModel = _handleSignUpResult(result.value as AuthSignUpStep);
      } else {
        toastifyModel =
            ToastifyModel(title: "Error", description: result.value.toString());
      }

      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
        toastifyModel: toastifyModel,
      ));
    } catch (e) {
      emit(
        state.copyWith(status: AuthenticationStatus.unauthenticated),
      );
    }
  }
}

ToastifyModel _handleSignUpResult(AuthSignUpStep result) {
  switch (result) {
    case AuthSignUpStep.confirmSignUp:
      return const ToastifyModel(
          title: "Check for OTP", description: "OTP is sent to your email");
    case AuthSignUpStep.done:
      return const ToastifyModel(
          title: "Welcome! ", description: "Sign Up Successful");
  }
}

ToastifyModel _handleSignInResult(AuthSignInStep result) {
  switch (result) {
    case AuthSignInStep.confirmSignInWithSmsMfaCode:
      return const ToastifyModel(
          title: "Confirm Sign In", description: "SMS MFA Sent");
    case AuthSignInStep.confirmSignInWithNewPassword:
      return const ToastifyModel(
          title: "Confirm Sign In", description: "Enter new Password");
    case AuthSignInStep.confirmSignInWithCustomChallenge:
      return const ToastifyModel(
          title: "Confirm Sign In", description: "Custom Challenge");
    case AuthSignInStep.resetPassword:
      return const ToastifyModel(
          title: "Reset Password", description: "To Continue");
    case AuthSignInStep.confirmSignUp:
      return const ToastifyModel(
          title: "Enter Code", description: "Code is sent to you");
    case AuthSignInStep.continueSignInWithMfaSelection:
      return const ToastifyModel(
          title: "Continue Sign In", description: "With MFA Selection");
    case AuthSignInStep.continueSignInWithTotpSetup:
      return const ToastifyModel(
          title: "Continue Sign In", description: "With TOTP");
    case AuthSignInStep.confirmSignInWithTotpMfaCode:
      return const ToastifyModel(
          title: "Continue Sign In", description: "With TOTP MFA");
    case AuthSignInStep.done:
      return const ToastifyModel(
          title: "Welcome!", description: "Sign In Successful!");
  }
}
