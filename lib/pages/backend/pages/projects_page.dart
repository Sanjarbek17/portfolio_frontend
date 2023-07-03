import 'package:flutter/material.dart';

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
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.81,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: white),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Image.asset('assets/images/Rectangle 22.png')),
                        const Divider(thickness: 1, color: white),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('project', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white)),
                                const SizedBox(height: 8),
                                SizedBox(width: 200, child: Text('Minecrsting ' * 100, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall)),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: const [
                                      LinkButton(text: 'Live <~~>'),
                                      LinkButton(text: 'Github >='),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
