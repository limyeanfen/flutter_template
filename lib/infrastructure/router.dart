import 'package:flutter/material.dart';
import 'package:flutter_template/features/main/home.dart';

class Router {
  static const String homeScreenRoute = '/home';
  static const String summaryScreenToute = '/summary';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => Home(),
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
