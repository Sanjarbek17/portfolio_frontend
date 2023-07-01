import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),

      // Compare this snippet from lib\routes.dart:
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteGenerator.backend,
      onUnknownRoute: RouteGenerator.unknownRoute,
    );
  }
}
