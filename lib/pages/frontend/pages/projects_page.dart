import 'package:flutter/material.dart';
import 'package:portfolio_frontend/core/providers/project_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/project_widgets.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 72.0),
      child: Consumer<ProjectProvider>(builder: (context, watch, child) {
        if (watch.status == ProjectStatus.loading) {
          watch.getProjects(ProjectType.frontend);
          return const Center(child: CircularProgressIndicator());
        } else if (watch.status == ProjectStatus.loaded) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProjectColumn(
                  projectList: watch.projects.getRange(0, watch.projects.length ~/ 2).map((e) => ProjectCard(projectModel: e)).toList(),
                  child: const Padding(
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
                projectList: watch.projects.getRange(watch.projects.length ~/ 2, watch.projects.length).map((e) => ProjectCard(projectModel: e)).toList(),
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
          );
        } else {
          return const Center(child: Text('Error'));
        }
      }),
    );
  }
}
