import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/custom_theme.dart';

import 'views/home_view.dart';

void main() {
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder:(context) => const MyApp(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, // Add the builder here
      title: 'Recipe',
      theme: customLightTheme(context),
      darkTheme: customDarkTheme(context),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
