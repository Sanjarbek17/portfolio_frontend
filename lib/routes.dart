import 'package:flutter/material.dart';
import 'package:portfolio_frontend/pages/frontend/frontend.dart';
import 'package:portfolio_frontend/pages/admin/admin.dart';
import 'package:portfolio_frontend/pages/admin/pages/dashboard_page.dart';
import 'package:portfolio_frontend/pages/admin/pages/create_project_page.dart';
import 'package:portfolio_frontend/pages/admin/pages/edit_project_page.dart';

import 'pages/backend/pages/init_page.dart' as backend_page;
// import 'pages/frontend/pages/main_page.dart' as frontend_page;

abstract class RouteGenerator {
  static const String home = '/';
  static const String frontend = '/frontend';
  static const String backend = '/backend';
  static const String admin = '/admin';
  static const String adminDashboard = '/admin/dashboard';
  static const String adminProjectsCreate = '/admin/projects/create';
  static const String adminProjectsEdit = '/admin/projects/edit';

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
          builder: (_) => const FrotendPage(),
        );
      case backend:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const backend_page.BackendPage(),
        );
      case admin:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AdminPage(isAuthenticated: false),
        );
      case adminDashboard:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AdminDashboardPage(),
        );
      case adminProjectsCreate:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CreateProjectPage(),
        );
      case adminProjectsEdit:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute<dynamic>(
          builder: (_) => EditProjectPage(projectData: args),
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
