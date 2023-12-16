import 'package:personal_finance/models/Transaction.dart';
import 'package:personal_finance/models/User.dart';

abstract class DashboardRepository {
  Future<User?> getUserData(String userId, String email);
  Future<List<Transaction?>> getUserTransactions(String userId);
}
