import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class AuthRepository {
  Future<bool> isUserSignedIn();

  Future<AuthUser> getCurrentUser();

  Future<void> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  });

  Future<void> confirmUser({
    required String username,
    required String confirmationCode,
  });

  Future<void> signInUser(String username, String password);
}
