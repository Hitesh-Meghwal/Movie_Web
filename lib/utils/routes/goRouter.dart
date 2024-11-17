import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieweb/screens/homeScreen.dart';

class Gorouter {
  static const homeScreen = '/homepage';

  // Create a custom navigator observer
  final CustomNavigatorObserver _navigatorObserver = CustomNavigatorObserver();

  final GoRouter router;

  Gorouter()
      : router = GoRouter(
          initialLocation: homeScreen,
          routes: [
            GoRoute(
              path: homeScreen,
              name: homeScreen,
              builder: (context, state) {
                return const Homescreen();
              },
            ),
          ],
          // Pass the observer to the GoRouter
          observers: [CustomNavigatorObserver()],
        );
}

// Custom Navigator Observer to log route changes
class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('Navigated to: ${route.settings.name ?? route.settings}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint(
        'Returned to: ${previousRoute?.settings.name ?? previousRoute?.settings}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint(
        'Replaced route: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}
