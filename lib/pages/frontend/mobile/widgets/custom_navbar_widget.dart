import 'package:flutter/material.dart';
import 'package:portfolio_frontend/core/providers/page_index_provider.dart';
import 'package:provider/provider.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    super.key,
    required this.context,
    required this.text,
    required this.selected,
  });

  final BuildContext context;
  final String text;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<PageIndexProvider>(context, listen: false).setPageIndex(selected);
        Navigator.of(context).pop();
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Sen', fontWeight: FontWeight.w400),
      ),
    );
  }
}
