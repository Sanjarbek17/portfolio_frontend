import 'package:flutter/material.dart';

import '../widgets/navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
        body: Column(
      children: [
        NavBar(),
        // Expanded(
        //   child: PageView(
        //     controller: value.itemScrollController,
        //     children: pages,
        //   ),
        // ),
      ],
    ));
  }
}
