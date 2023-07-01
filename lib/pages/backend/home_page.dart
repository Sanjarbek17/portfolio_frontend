import 'package:flutter/material.dart';
import 'package:portfolio_frontend/pages/backend/providers/page_index_provider.dart';
import 'package:provider/provider.dart';

import '../../core/style/colors.dart';
import 'about_me_page.dart';
import 'contacts_page.dart';
import 'projects_page.dart';
import 'widgets/nav_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const <Widget>[
    MainPage(),
    AboutMePage(),
    ContactPage(),
    ProjectPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Consumer<PageIndexProvider>(builder: (context, value, child) => pages[value.pageIndex]),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NavBar(currentPageIndex: 0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: const Row(
            children: [
              SizedBox(
                width: 537,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sanjarbek is a ',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'back-end developer',
                        style: TextStyle(color: Color(0xFFC778DD), fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'front-end developer',
                        style: TextStyle(color: Color(0xFFC778DD), fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
