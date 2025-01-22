// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:portfolio_frontend/core/providers/skillset_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/skill_set_card.dart';

class SkillSetPage extends StatelessWidget {
  const SkillSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkillSetCard(
              title: 'Skillset'.tr,
              description: 'With skills in over 4 different fields of flutter, I am the perfect person to hire when it comes to a full fledged project. Whatever your needs are, I can pretty much take on any challenge.'.tr,
              author: 'Sanjarbek S.'.tr,
            ),
            const SizedBox(height: 40),
            Consumer<SkillsetProvider>(builder: (context, watch, child) {
              if (watch.status == SkillsetStatus.loading) {
                watch.getSkills(SkillsetType.frontend);
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (watch.status == SkillsetStatus.loaded) {
                return Expanded(
                  child: Column(
                    children: watch.skills
                        .map((e) => SkillSetCard(
                              title: e.title,
                              description: e.description,
                              icon: SvgPicture.network(e.icon, color: Colors.blue, width: 50, height: 50),
                            ))
                        .toList(),
                  ),
                );
              } else {
                return Center(child: Text('Error'.tr));
              }
            }),
          ],
        ),
      ),
    );
  }
}
