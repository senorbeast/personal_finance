// user_use_case.dart
import 'package:injectable/injectable.dart';
import 'package:personal_finance/home/domain/repository/dashboard_repository.dart';
import 'package:personal_finance/models/Transaction.dart';
import 'package:personal_finance/models/User.dart';

@injectable
class DashboardUseCase {
  final DashboardRepository _dashboardRepository;

  DashboardUseCase(this._dashboardRepository);

  Future<User?> getUserData({required String userId, required String email}) =>
      _dashboardRepository.getUserData(userId, email);

  Future<List<Transaction?>> getUserTransactions({required String userId}) =>
      _dashboardRepository.getUserTransactions(userId);
}
