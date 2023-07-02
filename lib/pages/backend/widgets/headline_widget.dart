import 'package:flutter/material.dart';

import '../../../core/style/colors.dart';

class HeadlineWidget extends StatelessWidget {
  final String text;
  final TextButton? button;
  const HeadlineWidget({
    super.key,
    required this.text,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            navbarButton(context, text),
            const SizedBox(width: 16),
            Container(width: MediaQuery.of(context).size.width * 0.4, height: 1, color: primary),
          ],
        ),
        button ?? const SizedBox(),
      ],
    );
  }

  Text navbarButton(BuildContext context, String text, {int selected = 0}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '#', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primary)),
          TextSpan(text: text, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: white)),
        ],
      ),
    );
  }
}
