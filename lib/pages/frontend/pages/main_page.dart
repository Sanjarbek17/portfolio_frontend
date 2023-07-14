import 'package:flutter/material.dart';
import 'package:portfolio_frontend/pages/frontend/pages/home_page.dart';

import '../widgets/navbar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Expanded(child: HomePage()),
          Positioned(child: NavBar()),
        ],
      ),
    );
  }
}
