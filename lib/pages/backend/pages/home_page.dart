import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/providers/providers.dart';
import '../../../core/style/colors.dart';
import '../widgets/nav_bar_widget.dart';
import 'about_me_page.dart';
import 'contacts_page.dart';
import 'footer_page.dart';
import 'main_page.dart';
import 'projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  List<Widget> pages = const <Widget>[
    MainPage(),
    ProjectPage(),
    AboutMePage(),
    ContactPage(),
    FooterPage(),
  ];

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      Provider.of<PageIndexProvider>(context, listen: false).changePageIndex(itemPositionsListener.itemPositions.value.first.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Consumer<PageIndexProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              const NavBar(currentPageIndex: 0),
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemCount: pages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == pages.length - 1) {
                      return pages[index];
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 180.0),
                      child: pages[index],
                    );
                  },
                  itemPositionsListener: itemPositionsListener,
                  itemScrollController: value.itemScrollController,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
