import 'package:flutter/material.dart';
import 'injection_container.dart';
import 'package:provider/provider.dart';

import 'core/style/my_theme.dart';
import 'pages/backend/providers/page_index_provider.dart';
import 'routes.dart';
import 'core/providers/about_me_provider.dart';
import 'core/providers/contact_provider.dart';
import 'core/providers/project_provider.dart';
import 'core/providers/skillset_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageIndexProvider>(
          create: (_) => PageIndexProvider(),
        ),
        ChangeNotifierProvider<AboutMeProvider>(
          create: (_) => AboutMeProvider(repository: locator()),
        ),
        ChangeNotifierProvider<ContactProvider>(
          create: (_) => ContactProvider(repository: locator()),
        ),
        ChangeNotifierProvider<ProjectProvider>(
          create: (_) => ProjectProvider(repository: locator()),
        ),
        ChangeNotifierProvider<SkillsetProvider>(
          create: (_) => SkillsetProvider(repository: locator()),
        ),
      ],
      child: MaterialApp(
        title: 'Portfolio',
        theme: theme,

        debugShowCheckedModeBanner: false,
        // Compare this snippet from lib\routes.dart:
        initialRoute: RouteGenerator.frontend,
        onGenerateRoute: RouteGenerator.generateRoute,
        onUnknownRoute: RouteGenerator.unknownRoute,
      ),
    );
  }
}
