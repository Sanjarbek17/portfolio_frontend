import 'package:flutter/material.dart';
import 'package:portfolio_frontend/core/providers/project_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/style/colors.dart';
import '../widgets/headline_widget.dart';
import '../widgets/link_button.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          children: [
            HeadlineWidget(
                text: 'Projects',
                button: TextButton(
                  onPressed: () {},
                  child: Text('View all ~~>', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white)),
                )),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<ProjectProvider>(
                builder: (context, value, child) {
                  if (value.status == ProjectStatus.loading) {
                    value.getProjects(ProjectType.backend);
                    return const Center(child: CircularProgressIndicator());
                  } else if (value.status == ProjectStatus.loaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.81,
                      ),
                      itemCount: value.projects.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: white),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // image of project
                              Expanded(child: Image.network(value.projects[index].image, fit: BoxFit.cover)),
                              const Divider(thickness: 1, color: white),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // title of project
                                      Text(value.projects[index].title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white)),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 200,
                                        // description of project
                                        child: Text(value.projects[index].description, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall),
                                      ),
                                      Expanded(
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            LinkButton(
                                              text: 'Live <~~>',
                                              onTap: () {
                                                launchUrl(Uri.parse(value.projects[index].live));
                                              },
                                            ),
                                            LinkButton(
                                              text: 'Github >=',
                                              onTap: () {
                                                launchUrl(Uri.parse(value.projects[index].github));
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Error'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
