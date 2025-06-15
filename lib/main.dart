import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:luma_mind/screen/splash_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.dark,
      darkTheme: ShadThemeData(
        colorScheme: ShadSlateColorScheme.dark(),
        brightness: Brightness.dark,
      ),
      appBuilder: (context) {
        return GetMaterialApp(
          home: SplashScreen(),
          title: "Luma Mind",
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
        );
      },
    );
  }
}
