import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'projects_page.dart';
import '../widgets/navbar_widget.dart';
import 'about_me_page.dart';
import 'home_page.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          const Positioned(child: NavBar()),
        ],
      ),
    );
  }
}
