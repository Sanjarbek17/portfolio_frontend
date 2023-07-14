
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/style/colors.dart';
import '../../../core/providers/page_index_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sanjarbek is a ',
                            style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'back-end developer',
                            style: TextStyle(color: Color(0xFFC778DD), fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'front-end developer',
                            style: TextStyle(color: Color(0xFFC778DD), fontSize: 32, fontFamily: 'Fira Code', fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('He crafts responsive websites where technologies meet creativity', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => context.read<PageIndexProvider>().setPageIndex(3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(border: Border.all(color: primary)),
                        child: Text('Contact me !!', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 70,
                      left: 50,
                      child: SvgPicture.asset('assets/icons/developer.svg'),
                    ),
                    Image.asset('assets/images/avatar.png'),
                    Positioned(
                      bottom: 50,
                      right: 50,
                      child: SvgPicture.asset('assets/icons/Dots.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
