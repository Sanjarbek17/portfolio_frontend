import 'package:flutter/material.dart';

import '../../../core/style/colors.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: Make this button work
    // FIXME: It does no viewing correctly
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 120,
          height: 37,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(border: Border.all(color: primary)),
            child: Text(text, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white)),
          ),
        ),
      ),
    );
  }
}
