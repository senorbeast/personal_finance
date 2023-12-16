// repository_impl.dart
import 'package:injectable/injectable.dart';
import 'package:personal_finance/home/data/datasources/amplify_api.dart';
import 'package:personal_finance/home/domain/repository/dashboard_repository.dart';
import 'package:personal_finance/models/ModelProvider.dart';

@Injectable(as: DashboardRepository)
@lazySingleton
class DashboardRepositoryImpl extends DashboardRepository {
  final AmplifyApi _apiService;

  DashboardRepositoryImpl(this._apiService);

  @override
  Future<User?> getUserData(String userId, String email) =>
      _apiService.queryUserData(userId, email);

  @override
  Future<List<Transaction?>> getUserTransactions(String userId) =>
      _apiService.queryUserTransactions(userId);
}
