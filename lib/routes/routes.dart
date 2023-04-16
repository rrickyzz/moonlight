import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonlight/home/dashboard.dart';
import 'package:moonlight/home/home.dart';

class RouteBuilder {
  /// The route configuration.
  static GoRouter buildRoutes = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const Dashboard();
          },
        ),
      ],
    ),
  ], errorBuilder: (context, state) => const HomePage());
}
