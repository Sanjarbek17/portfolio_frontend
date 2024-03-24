import 'package:flutter/material.dart';
import 'package:portfolio_frontend/pages/frontend/mobile/main_page.dart' as mobile;
import 'package:portfolio_frontend/pages/frontend/desktop/main_page.dart' as desktop;
// import 'package:portfolio_frontend/pages/frontend/tablet/main_page.dart' as tablet;
import 'package:portfolio_frontend/responsive/screen_type_layout.dart';

class FrotendPage extends StatelessWidget {
  const FrotendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: mobile.MainPage(),
      tablet: desktop.MainPage(),
      desktop: desktop.MainPage(),
    );
  }
}
