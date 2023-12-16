import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AmplifyAuth {
  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  /// Signs a user up with a username, password, and email. The required
  /// attributes may be different depending on your app's configuration.
  Future<AuthResult<AuthSignUpStep>> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  }) async {
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        if (phoneNumber != null) AuthUserAttributeKey.phoneNumber: phoneNumber,
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      return _handleSignUpResult(result);
    } on AuthException catch (e) {
      return AuthResult.error(e);
    }
  }

  Future<AuthResult<AuthSignUpStep>> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      // Check if further confirmations are needed or if
      // the sign up is complete.
      return _handleSignUpResult(result);
    } on AuthException catch (e) {
      _safePrint('Error confirming user: ${e.message}');
      return AuthResult.error(e);
    }
  }

  AuthResult<AuthSignUpStep> _handleSignUpResult(SignUpResult result) {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        return const AuthResult.success(AuthSignUpStep.confirmSignUp);
      case AuthSignUpStep.done:
        _safePrint('Sign up is complete');
        return const AuthResult.success(AuthSignUpStep.done);
    }
  }

  Future<AuthResult<AuthSignInStep>> signInUser(
      String username, String password) async {
    try {
      await Amplify.Auth.signOut();
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      return _handleSignInResult(result);
    } on AuthException catch (e) {
      _safePrint('Error signing in: ${e.message}');
      return AuthResult.error(e);
    }
  }

  Future<AuthResult<AuthSignInStep>> _handleSignInResult(
      SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.confirmSignInWithSmsMfaCode:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        return const AuthResult.success(
            AuthSignInStep.confirmSignInWithSmsMfaCode);
      case AuthSignInStep.confirmSignInWithNewPassword:
        _safePrint('Enter a new password to continue signing in');
        return const AuthResult.success(
            AuthSignInStep.confirmSignInWithNewPassword);
      case AuthSignInStep.confirmSignInWithCustomChallenge:
        final parameters = result.nextStep.additionalInfo;
        final prompt = parameters['prompt']!;
        _safePrint(prompt);
        return const AuthResult.success(
          AuthSignInStep.confirmSignInWithCustomChallenge,
        );
      case AuthSignInStep.resetPassword:
        // Handle reset password if needed
        return const AuthResult.success(
          AuthSignInStep.confirmSignInWithNewPassword,
        );
      case AuthSignInStep.confirmSignUp:
        // Handle confirming sign up if needed
        return const AuthResult.success(
          AuthSignInStep.confirmSignUp,
        );
      case AuthSignInStep.continueSignInWithMfaSelection:
        return const AuthResult.success(
          AuthSignInStep.continueSignInWithMfaSelection,
        );
      case AuthSignInStep.continueSignInWithTotpSetup:
        return const AuthResult.success(
          AuthSignInStep.continueSignInWithTotpSetup,
        );
      case AuthSignInStep.confirmSignInWithTotpMfaCode:
        return const AuthResult.success(
          AuthSignInStep.confirmSignInWithTotpMfaCode,
        );
      case AuthSignInStep.done:
        _safePrint('Sign in is complete');
        return const AuthResult.success(
          AuthSignInStep.done,
        );
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    _safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  void _safePrint(String message) {
    // Implement your own logging mechanism or use print() here
    print(message);
  }
}
