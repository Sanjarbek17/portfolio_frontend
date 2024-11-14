import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/providers/page_index_provider.dart';
// import '../widgets/navbar_widget.dart';
import 'about_me_page.dart';
import 'contact_page.dart';
import 'footer_page.dart';
import 'home_page.dart';
import 'projects_page.dart';
import 'skillset_page.dart';
import 'widgets/custom_drawer.dart';

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

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.black,
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text('Sanjarbek S.'.tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => _key.currentState!.openEndDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
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
              // const Positioned(child: NavBar()),
            ],
          );
        },
      ),
    );
  }
}
