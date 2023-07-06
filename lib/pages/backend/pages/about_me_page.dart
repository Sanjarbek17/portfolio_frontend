import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_frontend/core/models/skill_model.dart';
import 'package:portfolio_frontend/core/providers/skillset_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/about_me_provider.dart';
import '../widgets/headline_widget.dart';
import '../widgets/link_button.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: [
          const SizedBox(height: 16),
          // TITLE: About me headline
          const SizedBox(height: 16),
          const HeadlineWidget(text: 'about-me'),
          const SizedBox(height: 16),
          Consumer<AboutMeProvider>(
            builder: (context, provider, child) {
              if (provider.status == AboutMeStatus.loading) {
                provider.getAboutMe();
                return const Center(child: CircularProgressIndicator());
              } else if (provider.status == AboutMeStatus.loaded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(provider.aboutMe!.description, style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(height: 16),
                          // FIXME: Button text is not showing fully
                          LinkButton(
                            text: 'Download CV <~~>',
                            // TODO: IMPLEMENT THIS
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(height: 500, child: Image.asset('assets/images/avatar2.png')),
                    )
                  ],
                );
              } else {
                return const Center(child: Text('Error'));
              }
            },
          ),
          const SizedBox(height: 180),
          // TITLE: Skills headline
          const HeadlineWidget(text: 'skills'),
          Consumer<SkillsetProvider>(builder: (context, value, child) {
            if (value.status == SkillsetStatus.loading) {
              value.getSkills(SkillsetType.backend);
              return const Center(child: CircularProgressIndicator());
            } else if (value.status == SkillsetStatus.loaded) {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SvgPicture.asset('assets/icons/skills.svg'),
                  ),
                   Expanded(
                      flex: 4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkillWidget(itemCount: 1, skills: value.skills.getRange(0, 1).toList()),
                          SkillWidget(itemCount: 2, skills: value.skills.getRange(1, 3).toList()),
                          SkillWidget(itemCount: 3, skills: value.skills.getRange(3, 6).toList()),
                        ],
                      ))
                ],
              );
            } else {
              return const Center(child: Text('Error'));
            }
          }),
        ],
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final int itemCount;
  final List<Skill> skills;

  const SkillWidget({
    super.key,
    required this.itemCount,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: List.generate(
          itemCount,
          (index) => skillCard(context, skills[index].title, skills[index].description),
        ),
      ),
    );
  }

  Container skillCard(BuildContext context, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          const Divider(thickness: 1, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(subtitle, style: Theme.of(context).textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
