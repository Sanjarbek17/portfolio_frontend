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
                  navbarButton(context, 'Projects'),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset('assets/images/avatar.png')),
                      const Divider(thickness: 1, color: white),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Project', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white)),
                            const SizedBox(height: 8),
                            Text('Description', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white)),
                          ],
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
