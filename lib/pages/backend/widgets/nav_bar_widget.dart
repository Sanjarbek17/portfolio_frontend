import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/style/colors.dart';
import '../providers/page_index_provider.dart';

class NavBar extends StatelessWidget {
  final int currentPageIndex;
  const NavBar({
    required this.currentPageIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: 0,
            left: -1 * MediaQuery.of(context).size.width * 0.07,
            child: Column(
              children: [
                // VerticalDivider(color: white, thickness: 10, width: 10),
                Container(
                  width: 1,
                  height: 190,
                  color: gray,
                ),
                // FIXME: buttons now pressing because of the stack
                const SizedBox(height: 8),
                const InkWell(child: Icon(Icons.discord, color: gray, size: 17)),
                const SizedBox(height: 8),
                const InkWell(child: Icon(Icons.telegram, color: gray, size: 17)),
                const SizedBox(height: 8),
                const InkWell(child: Icon(Icons.mail_outline, color: gray, size: 17)),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/logo.svg', color: white),
                    const SizedBox(width: 8),
                    Text(
                      'Sanjarbek',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    navbarButton(context, 'Home', selected: 0),
                    navbarButton(context, 'Projects', selected: 1),
                    navbarButton(context, 'About Me', selected: 2),
                    navbarButton(context, 'Contacts', selected: 3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton navbarButton(BuildContext context, String text, {int selected = 0}) {
    return TextButton(
      onPressed: () {
        context.read<PageIndexProvider>().setPageIndex(selected);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '#', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: primary)),
            TextSpan(text: text, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: selected == currentPageIndex ? white : gray)),
          ],
        ),
      ),
    );
  }
}
