import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_finance/core/presentation/app_root_with_providers.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:personal_finance/core/setup/ampliy_setup.dart';
import 'package:personal_finance/core/setup/injectable_setup.dart';
import 'package:personal_finance/core/setup/object_box_local_storage.dart';

// Generated in previous step

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;

  //Setup
  configureDependencies();
  objectbox = await ObjectBox.create();
  await configureAmplify();

  runApp(const AppRootWithProviders());
}
