import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sanjarbek S.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              navbarButton('Home', selected: 0),
              const SizedBox(width: 30),
              navbarButton('Projects', selected: 1),
              const SizedBox(width: 30),
              navbarButton('About', selected: 2),
              const SizedBox(width: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                color: const Color(0xFF5221E6),
                child: navbarButton('Contact', selected: 3),
              ),
              const SizedBox(width: 30),
            ],
          )
        ],
      ),
    );
  }

  TextButton navbarButton(String text, {int selected = 0}) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400),
      ),
    );
  }
}
