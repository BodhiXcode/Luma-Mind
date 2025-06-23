import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luma_mind/providers/routes_provider.dart';
import 'package:luma_mind/screen/home_screen.dart';
import 'package:luma_mind/screen/splash_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ShadApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      themeMode: ThemeMode.dark,
      darkTheme: ShadThemeData(
        colorScheme: ShadNeutralColorScheme.light(),
        brightness: Brightness.light,
      ),
      routerConfig: router,
      builder: (context, child) {
        return ShadAppBuilder(child: child);
      },
    );
  }
}
