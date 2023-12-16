import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_finance/auth/domain/repository/auth_repository.dart';

@injectable
class AuthenticationUseCase {
  final AuthRepository _authRepository;
  AuthenticationUseCase(this._authRepository);

  Future<bool> isUserSignedIn() async {
    return await _authRepository.isUserSignedIn();
  }

  Future<AuthUser> getCurrentUser() async {
    return await _authRepository.getCurrentUser();
  }

  Future<AuthResult<AuthSignUpStep>> signUp({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  }) async {
    // Additional business logic before calling repository
    return await _authRepository.signUpUser(
      username: username,
      password: password,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  Future<AuthResult<AuthSignUpStep>> confirmSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    // Additional business logic before calling repository
    return await _authRepository.confirmUser(
      username: username,
      confirmationCode: confirmationCode,
    );
  }

  Future<AuthResult<AuthSignInStep>> signIn({
    required String username,
    required String password,
  }) async {
    // Additional business logic before calling repository
    return await _authRepository.signInUser(username, password);
  }

  // Future<void> signOut() async {
  //   // Additional business logic before calling repository (if needed)
  //   // ...
  //   // Call repository
  //   await _authRepository.signOut();
  // }
}
