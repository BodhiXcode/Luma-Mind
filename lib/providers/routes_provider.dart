import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:luma_mind/screen/home_screen.dart';
import 'package:luma_mind/screen/quick_note_new_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => HomeScreen()),
      GoRoute(
        path: "/new_thought",
        builder: (context, state) => QuickNoteNewScreen(),
      ),
    ],
  );
});
