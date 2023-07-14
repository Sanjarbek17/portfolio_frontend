import 'package:flutter/material.dart';
import 'package:portfolio_frontend/pages/backend/pages/footer_page.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/navbar_widget.dart';
import 'about_me_page.dart';
import 'contact_page.dart';
import 'home_page.dart';
import 'projects_page.dart';
import 'skillset_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = const <Widget>[
    HomePage(),
    AboutMePage(),
    SkillSetPage(),
    ProjectPage(),
    ContactPage(),
    FooterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          const Positioned(child: NavBar()),
        ],
      ),
    );
  }
}
