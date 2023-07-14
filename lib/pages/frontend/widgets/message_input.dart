
import 'package:flutter/material.dart';

class MesageInput extends StatelessWidget {
  final String name;
  final int maxLines;
  final TextEditingController? controller;

  const MesageInput({
    super.key,
    required this.name,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400)),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(
            fillColor: Color(0xFF181823),
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
