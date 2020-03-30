import 'package:flutter/material.dart';
import 'package:flutter_template/features/main/home_screen.dart';
import 'package:flutter_template/features/record/record_summary_screen.dart';

class Router {
  static const String initialScreenRoute = '/';
  static const String homeScreenRoute = '/home';
  static const String recordSummaryScreenRoute = '/recordSummary';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
      case initialScreenRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      case recordSummaryScreenRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => RecordSummaryScreen(),
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
