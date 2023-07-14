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
      height: 900,
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
              height: MediaQuery.of(context).size.height * 0.7,
              // height: 700,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Positioned(
              // top: 0,
              right: 40,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'I’m Robin Williams.\nA product designer \n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 76,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'based in Italy.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 76,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
