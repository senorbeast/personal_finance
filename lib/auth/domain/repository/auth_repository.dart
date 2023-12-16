import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class AuthRepository {
  Future<bool> isUserSignedIn();

  Future<AuthUser> getCurrentUser();

  Future<AuthResult<AuthSignUpStep>> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  });

  Future<AuthResult<AuthSignUpStep>> confirmUser({
    required String username,
    required String confirmationCode,
  });

  Future<AuthResult<AuthSignInStep>> signInUser(
      String username, String password);
}
