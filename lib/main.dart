import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:sutt_round_1/Screens/homeScreen.dart';
import 'package:sutt_round_1/Screens/splashScreen.dart';

class g_translate_app extends StatelessWidget {

  final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => MyHomePage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}




void main() {
  runApp(g_translate_app());
}



