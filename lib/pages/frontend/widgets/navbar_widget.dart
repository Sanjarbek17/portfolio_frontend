import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/providers/page_index_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 82),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sanjarbek S.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                navbarButton(context, 'Home', selected: 0),
                const SizedBox(width: 30),
                navbarButton(context, 'About', selected: 1),
                const SizedBox(width: 30),
                navbarButton(context, 'SkillSeet', selected: 2),
                const SizedBox(width: 30),
                navbarButton(context, 'Projects', selected: 3),
                const SizedBox(width: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  color: const Color(0xFF5221E6),
                  child: navbarButton(context, 'Contact', selected: 4),
                ),
                const SizedBox(width: 30),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextButton navbarButton(BuildContext context, String text, {int selected = 0}) {
    return TextButton(
      onPressed: () {
        Provider.of<PageIndexProvider>(context, listen: false).setPageIndex(selected);
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400),
      ),
    );
  }
}
