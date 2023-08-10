import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:worldline_flutter/ui/navigation/routes.dart';
import 'package:worldline_flutter/ui/widgets/screens/home/home_screen.dart';
import 'package:worldline_flutter/ui/widgets/screens/splash/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class MainNavigator {
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) =>
            HomeScreen(),
      ),
    ],
  );

  Future<void> navigateToSplash() {
    return router.push(Routes.splash);
  }

  Future<void> navigateToHome() {
    return router.push(Routes.home);
  }

  void pop() {
    if (router.canPop()) router.pop();
  }
}
