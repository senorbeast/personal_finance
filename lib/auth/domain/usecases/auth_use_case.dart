import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_finance/auth/domain/repository/auth_repository.dart';

final getIt = GetIt.instance;

@injectable
class AuthenticationUseCase {
  final AuthRepository _authRepository;
  AuthenticationUseCase(this._authRepository);

  Future<bool> isUserSignedIn() async {
    return await _authRepository.isUserSignedIn();
  }

  Future<void> signUp({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  }) async {
    // Additional business logic before calling repository
    await _authRepository.signUpUser(
      username: username,
      password: password,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  Future<void> confirmSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    // Additional business logic before calling repository
    await _authRepository.confirmUser(
      username: username,
      confirmationCode: confirmationCode,
    );
  }

  Future<void> signIn(String username, String password) async {
    // Additional business logic before calling repository
    await _authRepository.signInUser(username, password);
  }

  // Future<void> signOut() async {
  //   // Additional business logic before calling repository (if needed)
  //   // ...
  //   // Call repository
  //   await _authRepository.signOut();
  // }
}
