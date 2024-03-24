import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:portfolio_frontend/container_injection.dart';
import 'package:portfolio_frontend/controllers/language_controller.dart';
import 'package:portfolio_frontend/core/constants/app_constants.dart';
import 'package:portfolio_frontend/utils/messages.dart';
import 'injection_container.dart';
import 'package:provider/provider.dart';

import 'core/style/my_theme.dart';
import 'core/providers/page_index_provider.dart';
import 'routes.dart';
import 'core/providers/about_me_provider.dart';
import 'core/providers/contact_provider.dart';
import 'core/providers/project_provider.dart';
import 'core/providers/skillset_provider.dart';

typedef Dict = Map<String, Map<String, String>>;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupLocator();
  Dict languages = await init();
  runApp(App(languages: languages));
}

class App extends StatelessWidget {
  final Dict languages;
  const App({super.key, required this.languages});

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
      child: GetBuilder<LocalizationController>(builder: (controller) {
        return GetMaterialApp(
          title: 'Portfolio',
          theme: theme,
          locale: controller.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
          debugShowCheckedModeBanner: false,
          // Compare this snippet from lib\routes.dart:
          initialRoute: RouteGenerator.frontend,
          onGenerateRoute: RouteGenerator.generateRoute,
          onUnknownRoute: RouteGenerator.unknownRoute,
        );
      }),
    );
  }
}
