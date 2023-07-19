import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/providers.dart';
import '../../../injection_container.dart';
import 'home_page.dart';

class BackendPage extends StatelessWidget {
  const BackendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<PageIndexProvider>(
          create: (_) => locator(),
        ),
        ChangeNotifierProvider<AboutMeProvider>(
          create: (_) => locator(),
        ),
        ChangeNotifierProvider<ContactProvider>(
          create: (_) => locator(),
        ),
        ChangeNotifierProvider<ProjectProvider>(
          create: (_) => locator(),
        ),
        ChangeNotifierProvider<SkillsetProvider>(
          create: (_) => locator(),
        ),
      ],
      child:  const HomePage(),
    );
  }
}
