import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:personal_finance/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:personal_finance/models/ModelProvider.dart';

Future<void> configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(auth);
    await Amplify.addPlugin(api);

    // call Amplify.configure to use the initialized categories in your app
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred configuring Amplify: $e');
  }
}
