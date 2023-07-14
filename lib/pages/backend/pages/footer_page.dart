// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/style/colors.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: gray, thickness: 1, height: 1),
        const SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/logo.svg', color: white),
                      const SizedBox(width: 8),
                      Text(
                        'Sanjarbek',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white, fontWeight: FontWeight.w600),
                      ),
                      Text('  sanjarbeksaidov173@gmail.com', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Web designer and front-end developer', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15)),
                ],
              ),
              Column(
                children: [
                  Text('Media', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(child: Icon(Icons.discord, color: gray, size: 17)),
                      SizedBox(width: 8),
                      InkWell(child: Icon(Icons.telegram, color: gray, size: 17)),
                      SizedBox(width: 8),
                      InkWell(child: Icon(Icons.mail_outline, color: gray, size: 17)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© 2021 Sanjarbek Saidov. All rights reserved.',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: gray),
            )
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
