import 'package:flutter/material.dart';

import '../../core/style/colors.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  navbarButton(context, 'projects'),
                  const SizedBox(width: 16),
                  Container(width: MediaQuery.of(context).size.width * 0.4, height: 1, color: primary),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text('View all ~~>', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
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
                                  children: [
                                    linkButton(context, 'Live <~~>'),
                                    linkButton(context, 'Github >='),
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
    );
  }

  Padding linkButton(BuildContext context, String text) {
    // TODO: Make this a button
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 110,
          height: 37,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(border: Border.all(color: primary)),
            child: Text(text, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white)),
          ),
        ),
      ),
    );
  }

  Text navbarButton(BuildContext context, String text, {int selected = 0}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '#', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: primary)),
          TextSpan(text: text, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: white)),
        ],
      ),
    );
  }
}
