import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_finance/models/ModelProvider.dart';

@lazySingleton
class AmplifyApi {
  Future<User?> queryUserData(String userId, String email) async {
    try {
      final request =
          ModelQueries.get(User.classType, UserModelIdentifier(id: userId));
      final response = await Amplify.API.query(request: request).response;

      final userData = response.data;
      if (userData == null) {
        print('errors Here: ${response.errors}');
      }
      print(
          'User data: ${userData?.email}, ${userData?.balance}, ${userData?.accountNo}');
      return userData;
    } on ApiException catch (e) {
      print('Query failed: $e');
      return null;
    }
  }

  Future<List<Transaction?>> queryUserTransactions(String userId) async {
    try {
      final request = ModelQueries.list(Transaction.classType);
      final response = await Amplify.API.query(request: request).response;
      final userWithTransactions = response.data;
      if (userWithTransactions == null) {
        print('errors: ${response.errors}');
        return const [];
      }

      final transactions = userWithTransactions.items;
      for (var transaction in transactions) {
        print(
            'Transaction: ${transaction?.amount}, ${transaction?.datetime}, ${transaction?.otherAccount}');
      }
      return transactions;
    } on ApiException catch (e) {
      print('Query failed: $e');
      return const [];
    }
  }
}

// Usage example
// void main() async {
//   final currentUserId = await AmplifyApiService.getCurrentUserId();
//   if (currentUserId != null) {
//     print('Current User ID: $currentUserId');

//     await AmplifyApiService.queryUserData(currentUserId);
//     await AmplifyApiService.queryUserTransactions(currentUserId);
//   } else {
//     print('Failed to retrieve current user ID.');
//   }
// }
