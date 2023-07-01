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
    return SizedBox(
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
    );
  }

  TextButton navbarButton(BuildContext context, String text, {int selected = 0}) {
    return TextButton(
        onPressed: () {
          context.read<PageIndexProvider>().setPageIndex(selected);
        },
        child: Text.rich(TextSpan(
          children: [
            TextSpan(text: '#', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: primary)),
            TextSpan(text: text, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: selected == currentPageIndex ? white : gray)),
          ],
        )));
  }
}
