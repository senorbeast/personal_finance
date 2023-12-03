import 'package:flutter/material.dart';
import 'package:personal_finance/core/presentation/theme.dart';
import 'package:personal_finance/core/presentation/widgets/main_drawer.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  var themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();

    return MaterialApp(
      themeMode: themeMode,
      theme: theme.toThemeData(),
      darkTheme: theme.toThemeDataDark(),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        final tt = Theme.of(context).textTheme;
        final cs = Theme.of(context).colorScheme;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cs.onTertiary,
            title: Text(
              'Manage your Finance',
              style: tt.titleMedium!.copyWith(
                color: cs.onTertiaryContainer,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  final useLight = themeMode == ThemeMode.dark ? true : false;
                  handleBrightnessChange(useLight);
                },
                icon: const Icon(Icons.light_mode),
              ),
            ],
          ),
          drawer: const MainDrawer(),
          body: Text(
            "Hi",
            style: tt.headlineLarge!.copyWith(
              color: cs.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }

  // bool get useLightMode {
  //   switch (themeMode) {
  //     case ThemeMode.system:
  //       return View.of(context).platformDispatcher.platformBrightness ==
  //           Brightness.light;
  //     case ThemeMode.light:
  //       return true;
  //     case ThemeMode.dark:
  //       return false;
  //   }
  // }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
}
