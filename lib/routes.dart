import 'package:flutter/material.dart';

import 'pages/backend/home_page.dart' as backend_page;



abstract class RouteGenerator {
  static const String home = '/';
  static const String frontend = '/frontend';
  static const String backend = '/backend';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Home')),
          ),
        );
      case frontend:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Frontend')),
          ),
        );
      case backend:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const backend_page.HomePage(),
        );
      default:
        throw const FormatException('Route not found');
    }
  }

  // unknownRoute is called when the app is unable to find a route
  // in the routeMap
  static Route<dynamic> unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Route for ${settings.name} not found'),
        ),
      ),
    );
  }
}
