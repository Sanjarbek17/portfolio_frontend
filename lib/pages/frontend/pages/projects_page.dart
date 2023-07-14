import 'package:flutter/material.dart';

import '../widgets/project_widgets.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 72.0),
      child: Row(
        children: [
          const Expanded(
            child: ProjectColumn(
              projectList: [
                ProjectCard(
                  title: 'Project Title',
                  description:
                      'I worked with the guys at CBRE to redesign their entire website and mobile app fro both Android and iOS. This project lasted for 4 months and was a very challenging one.',
                  image: 'assets/frontend/images/project.png',
                ),
                ProjectCard(
                  title: 'Project Title',
                  description:
                      'I worked with the guys at CBRE to redesign their entire website and mobile app fro both Android and iOS. This project lasted for 4 months and was a very challenging one.',
                  image: 'assets/frontend/images/project.png',
                ),
                ProjectCard(
                  title: 'Project Title',
                  description:
                      'I worked with the guys at CBRE to redesign their entire website and mobile app fro both Android and iOS. This project lasted for 4 months and was a very challenging one.',
                  image: 'assets/frontend/images/project.png',
                ),
              ],
              child: Padding(
                padding: EdgeInsets.only(right: 81.0, bottom: 81.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MY PROJECTS',
                      style: TextStyle(
                        color: Color(0xFF8490A0),
                        fontSize: 16,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text('Work that I’ve done for the past years', style: TextStyle(color: Colors.white, fontSize: 55, fontFamily: 'Sen', fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: ProjectColumn(
            reverse: true,
            projectList: const [
              ProjectCard(
                title: 'Project Title',
                description:
                    'I worked with the guys at CBRE to redesign their entire website and mobile app fro both Android and iOS. This project lasted for 4 months and was a very challenging one.',
                image: 'assets/frontend/images/project.png',
              ),
              ProjectCard(
                title: 'Project Title',
                description:
                    'I worked with the guys at CBRE to redesign their entire website and mobile app fro both Android and iOS. This project lasted for 4 months and was a very challenging one.',
                image: 'assets/frontend/images/project.png',
              ),
              ProjectCard(
                title: 'Project Title',
                description:
                    'I worked with the guys at CBRE to redesign their entire website and mobile app fro both Android and iOS. This project lasted for 4 months and was a very challenging one.',
                image: 'assets/frontend/images/project.png',
              ),
            ],
            child: Container(
              padding: const EdgeInsets.only(top: 80),
              alignment: Alignment.center,
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(border: Border.all(color: const Color(0xFF0077FF))),
                child: TextButton(onPressed: () {}, child: const Text('VIEW ALL PROJECTS')),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
