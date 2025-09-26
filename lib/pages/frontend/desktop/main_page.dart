import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:get/get.dart';

import '../../../core/providers/page_index_provider.dart';
import '../widgets/navbar_widget.dart';
import 'about_me_page.dart';
import 'contact_page.dart';
import 'footer_page.dart';
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
      body: Consumer<PageIndexProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              ScrollablePositionedList.builder(
                itemScrollController: value.itemScrollController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
              const Positioned(child: NavBar()),
              // Floating Admin Access Button
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () => Get.toNamed('/admin'),
                  backgroundColor: const Color(0xFF00D4AA),
                  child: const Icon(
                    Icons.admin_panel_settings,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
