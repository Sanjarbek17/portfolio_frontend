import 'package:flutter/material.dart';

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
                description:
                    'With skills in over 4 different fields of design, I am the perfect person to hire when it comes to a full fledged project. Whatever your needs are, I can pretty much take on any challenge.',
                author: 'Sanjarbek S.',
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: const [
                    SkillSetCard(
                      icon: Icon(Icons.code, color: Colors.blue, size: 55),
                      title: 'Product Design',
                      description: 'Working at Facebook has taught me a lot about how to understand users, solve problems and build great products.',
                    ),
                    SkillSetCard(
                      icon: Icon(Icons.code, color: Colors.blue, size: 55),
                      title: 'Product Design',
                      description: 'Working at Facebook has taught me a lot about how to understand users, solve problems and build great products.',
                    ),
                    SkillSetCard(
                      icon: Icon(Icons.code, color: Colors.blue, size: 55),
                      title: 'Product Design',
                      description: 'Working at Facebook has taught me a lot about how to understand users, solve problems and build great products.',
                    ),
                    SkillSetCard(
                      icon: Icon(Icons.code, color: Colors.blue, size: 55),
                      title: 'Product Design',
                      description: 'Working at Facebook has taught me a lot about how to understand users, solve problems and build great products.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
