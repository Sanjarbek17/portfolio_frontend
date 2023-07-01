import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/style/my_theme.dart';
import 'pages/backend/providers/page_index_provider.dart';
import 'routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Compare this snippet from lib\main.dart:
        // ChangeNotifierProvider<AboutMeProvider>(
        //   create: (_) => AboutMeProvider(repository: PortfolioRepository()),
        // ),
        ChangeNotifierProvider<PageIndexProvider>(
          create: (_) => PageIndexProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Portfolio',
        theme: theme,

        debugShowCheckedModeBanner: false,
        // Compare this snippet from lib\routes.dart:
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RouteGenerator.backend,
        onUnknownRoute: RouteGenerator.unknownRoute,
      ),
    );
  }
}
