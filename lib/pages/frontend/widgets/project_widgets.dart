import 'package:flutter/material.dart';

class ProjectColumn extends StatelessWidget {
  final bool reverse;
  final Widget child;
  final List<ProjectCard> projectList;
  const ProjectColumn({
    super.key,
    this.reverse = false,
    required this.projectList,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      reverse: reverse,
      children: [
        child,
        Column(
          children: projectList,
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.43,
        margin: const EdgeInsets.only(bottom: 25),
        color: const Color(0xFF181823),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(image, fit: BoxFit.cover, scale: 0.9),
            // const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Sen', fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  Text(description, style: const TextStyle(color: Color(0xFF8491A0), fontSize: 18, fontFamily: 'Sen', fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ));
  }
}
