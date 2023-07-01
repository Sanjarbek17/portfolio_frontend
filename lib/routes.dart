import 'package:flutter/material.dart';

abstract class RouteGenerator {
  static const String home = '/';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Home')),
          ),
        );
      case login:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Login')),
          ),
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
