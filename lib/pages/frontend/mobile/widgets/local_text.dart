import 'package:flutter/material.dart';
import 'package:portfolio_frontend/core/style/colors.dart';

class LocalText extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onPressed;

  const LocalText({
    super.key,
    required this.text,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isSelected ? Colors.black26 : Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(color: primary, fontSize: 14, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
