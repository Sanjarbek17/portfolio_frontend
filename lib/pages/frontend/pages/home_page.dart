import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 900,
              width: MediaQuery.of(context).size.width * 0.65,
              color: const Color(0xFF181823),
            ),
          ),
          Positioned(
            left: 0,
            child: Image.asset(
              'assets/frontend/images/avatar.png',
              // height: MediaQuery.of(context).size.height * 0.7,
              // height: 700,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          Positioned(
            // top: 0,
            right: 100,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'I’m Sanjarbek S. Frontend Developer ',
                          style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05, fontFamily: 'Sen', fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'based in Uzbekistan.',
                          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: MediaQuery.of(context).size.width * 0.05, fontFamily: 'Sen', fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'I’m probably the most passionate frontend developer you will ever get to work with. If you have a great project that needs some amazing skills, I’m your guy.',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.015, fontFamily: 'Sen', fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
