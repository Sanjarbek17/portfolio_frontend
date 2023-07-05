import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_frontend/pages/backend/pages/footer_page.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/style/colors.dart';
import '../providers/page_index_provider.dart';
import '../widgets/nav_bar_widget.dart';
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
      // body: Consumer<PageIndexProvider>(builder: (context, value, child) => pages[value.pageIndex]),
      body: Consumer<PageIndexProvider>(builder: (context, value, child) {
        return Column(
          children: [
            const NavBar(currentPageIndex: 0),
            Expanded(
              child: ScrollablePositionedList.builder(
                itemCount: pages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index==pages.length-1){
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
      }),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
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
                    const SizedBox(height: 20),
                    Text('He crafts responsive websites where technologies meet creativity', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => context.read<PageIndexProvider>().setPageIndex(2),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(border: Border.all(color: primary)),
                        child: Text('Contact me !!', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 70,
                      left: 50,
                      child: SvgPicture.asset('assets/icons/developer.svg'),
                    ),
                    Image.asset('assets/images/avatar.png'),
                    Positioned(
                      bottom: 50,
                      right: 50,
                      child: SvgPicture.asset('assets/icons/Dots.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
