import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_finance/core/presentation/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeGetIt();
  Animate.restartOnHotReload = true;

  runApp(const AppRoot());
}
