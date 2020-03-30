import 'package:flutter/material.dart';
import 'package:flutter_template/features/main/home_screen.dart';

class Router {
  static const String initialScreenRoute = '/';
  static const String homeScreenRoute = '/home';
  static const String summaryScreenRoute = '/summary';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
      case initialScreenRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
