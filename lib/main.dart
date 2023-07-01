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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      // Compare this snippet from lib\routes.dart:
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteGenerator.home,
      onUnknownRoute: RouteGenerator.unknownRoute,
    );
  }
}
