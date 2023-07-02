import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_frontend/pages/backend/widgets/headline_widget.dart';
import 'package:portfolio_frontend/pages/backend/widgets/link_button.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: [
          const HeadlineWidget(text: 'skills'),
          const SizedBox(height: 16),
          // TITLE: Skills headline
          Row(
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset('assets/icons/skills.svg'),
              ),
              // const Spacer(flex: 1),
              const Expanded(
                  flex: 4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkillWidget(itemCount: 1),
                      SkillWidget(itemCount: 2),
                      SkillWidget(itemCount: 3),
                    ],
                  ))
            ],
          ),
          // TITLE: About me headline
          const SizedBox(height: 16),
          const HeadlineWidget(text: 'about-me'),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About me asd;f aksdf;l kasdjf asdf ', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    // FIXME: Button text is not showing fully
                    const LinkButton(text: 'Download CV <~~>'),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(height: 500, child: Image.asset('assets/images/avatar2.png')),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final int itemCount;
  const SkillWidget({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: List.generate(
          itemCount,
          (index) => skillCard(context, 'Languages', 'Dart Python JavaSCript ' * (index + 1)),
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
