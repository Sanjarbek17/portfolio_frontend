// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_frontend/core/providers/skillset_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/skill_set_card.dart';

class SkillSetPage extends StatelessWidget {
  const SkillSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 72.0, vertical: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 4,
              child: SkillSetCard(
                title: 'Skillset',
                description: 'With skills in over 4 different fields of flutter, I am the perfect person to hire when it comes to a full fledged project. Whatever your needs are, I can pretty much take on any challenge.',
                author: 'Sanjarbek S.',
              ),
            ),
            Expanded(
              flex: 6,
              child: Consumer<SkillsetProvider>(builder: (context, watch, child) {
                if (watch.status == SkillsetStatus.loading) {
                  watch.getSkills(SkillsetType.frontend);
                  return const Center(child: CircularProgressIndicator());
                } else if (watch.status == SkillsetStatus.loaded) {
                  return Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: watch.skills
                                .getRange(0, watch.skills.length ~/ 2)
                                .map((e) => SkillSetCard(
                                      title: e.title,
                                      description: e.description,
                                      icon: SvgPicture.network(e.icon, color: Colors.blue, width: 50, height: 50),
                                    ))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: watch.skills
                                .getRange(watch.skills.length ~/ 2, watch.skills.length)
                                .map((e) => SkillSetCard(
                                      title: e.title,
                                      description: e.description,
                                      // icon: SvgPicture.network(e.icon, color: Colors.blue, width: 50, height: 50),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('Error'));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
