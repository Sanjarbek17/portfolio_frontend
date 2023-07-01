import 'package:flutter/material.dart';

import 'about_me_page.dart';
import 'contacts_page.dart';
import 'projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  List<Widget> pages = const <Widget>[
    MainPage(),
    AboutMePage(),
    ContactPage(),
    ProjectPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanjarbek'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('#Home')),
          TextButton(onPressed: () {}, child: const Text('#Projects')),
          TextButton(onPressed: () {}, child: const Text('#About Me')),
          TextButton(onPressed: () {}, child: const Text('#Contacts')),
        ],
      ),
      body: pages[selectedPageIndex],
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Main Page'),
    );
  }
}
