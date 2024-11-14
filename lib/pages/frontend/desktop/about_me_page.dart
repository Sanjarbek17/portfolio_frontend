import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFFFF3E4),
      child: Row(
        children: [
           Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'About me'.tr,
                    style: const TextStyle(
                      color: Color(0xFF171723),
                      fontSize: 55,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "I'm a Flutter developer who loves creating mobile apps that bring people together, promote inner peace, and provide unforgettable experiences. For me, it's all about being genuine, thinking outside the box, and making users feel at home in the apps I develop.".tr,
                    style: const TextStyle(
                      color: Color(0xFF5B6876),
                      fontSize: 18,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset('assets/frontend/images/aboutme.png', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
