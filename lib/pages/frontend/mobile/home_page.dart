import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      child: Column(
        // alignment: Alignment.center,

        children: [
          Image.asset(
            'assets/frontend/images/avatar.png',
            // height: height * 0.7,
            // height: 700,
            width: width,
          ),
          Container(
            height: height * 0.5,
            // width: width * 0.65,
            color: const Color(0xFF181823),
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'I’m Sanjarbek S. Frontend Developer '.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.06,
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'based in Uzbekistan.'.tr,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: width * 0.06,
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'I’m probably the most passionate frontend developer you will ever get to work with. If you have a great project that needs some amazing skills, I’m your guy.'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
