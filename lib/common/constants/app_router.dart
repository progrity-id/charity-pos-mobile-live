import 'package:flutter/material.dart';

import '../../presentation/login/login_page.dart';
import '../../presentation/splashscreen/splashscreen_page.dart';
import 'route_constant.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.splashscreen:
        return MaterialPageRoute(
          builder: (_) => const SplashscreenPage(),
        );
      case RouteConstants.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Center(child: Text("Something wrong")),
        );
    }
  }
}