import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_finance/auth/data/datasources/amplify_auth.dart';
import 'package:personal_finance/auth/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
@lazySingleton
class AuthRepositoryImpl extends AuthRepository {
  final AmplifyAuth _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<bool> isUserSignedIn() async {
    return _remoteDataSource.isUserSignedIn();
  }

  @override
  Future<AuthUser> getCurrentUser() async {
    return _remoteDataSource.getCurrentUser();
  }

  @override
  Future<AuthResult<AuthSignUpStep>> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  }) async {
    return _remoteDataSource.signUpUser(
      username: username,
      password: password,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<AuthResult<AuthSignUpStep>> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    return _remoteDataSource.confirmUser(
      username: username,
      confirmationCode: confirmationCode,
    );
  }

  @override
  Future<AuthResult<AuthSignInStep>> signInUser(
      String username, String password) async {
    return _remoteDataSource.signInUser(username, password);
  }
}
