import 'package:flutter/material.dart';

class SkillSetCard extends StatelessWidget {
  final String title;
  final String description;
  final String? author;
  final Widget? icon;

  const SkillSetCard({
    super.key,
    required this.title,
    required this.description,
    this.author,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon ?? const SizedBox(),
        Text(title, style: TextStyle(color: Colors.white, fontSize: icon == null ? 34: 24, fontFamily: 'Sen', fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        SizedBox(
          width: 370,
          child: Text(description, style: TextStyle(color: const Color(0xFF8491A0), fontSize: icon == null ? 18 : 16, fontFamily: 'Sen', fontWeight: FontWeight.w400)),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: author != null,
          child: Text(author ?? '', style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Sen', fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
