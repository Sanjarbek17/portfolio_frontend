import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:portfolio_frontend/core/providers/project_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/project_widgets.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<ProjectProvider>(builder: (context, watch, child) {
          if (watch.status == ProjectStatus.loading) {
            watch.getProjects(ProjectType.frontend);
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (watch.status == ProjectStatus.loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ProjectColumn(
                    projectList: watch.projects.map((e) => ProjectCard(projectModel: e)).toList(),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 81.0, bottom: 81.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('MY PROJECTS'.tr, style: const TextStyle(color: Color(0xFF8490A0), fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w700)),
                          Text(
                            'Work that I’ve done for the past years'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('Error'.tr));
          }
        }),
      ),
    );
  }
}
