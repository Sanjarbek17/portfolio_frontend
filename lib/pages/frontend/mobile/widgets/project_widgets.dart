import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_frontend/core/models/project_model.dart';
import 'package:portfolio_frontend/core/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Column(
      children: [
        child,
        Column(
          children: projectList,
        ),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectModel projectModel;

  const ProjectCard({
    super.key,
    required this.projectModel,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  double x = 0;
  double y = 0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) => setState(() {
        isHover = false;
      }),
      child: Stack(
        children: [
          // FIXME: this is not working on mobile
          GestureDetector(
            onTapDown: (event) {
              setState(() {
                isHover = true;
                x = event.localPosition.dx;
                y = event.localPosition.dy;
              });
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 25),
                color: const Color(0xFF181823),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(imageUrl: widget.projectModel.image, fit: BoxFit.cover),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(widget.projectModel.title, style: const TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Sen', fontWeight: FontWeight.w700)),
                          const SizedBox(height: 20),
                          Text(widget.projectModel.description, style: const TextStyle(color: Color(0xFF8491A0), fontSize: 18, fontFamily: 'Sen', fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Visibility(
            visible: isHover,
            child: Positioned(
              left: x,
              top: y,
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(color: const Color(0xFF0077FF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() => isHover = false);
                        launchUrl(Uri.parse(widget.projectModel.github));
                      },
                      child: const Text('GITHUB'),
                    ),
                    const Divider(color: gray, height: 0),
                    TextButton(
                      onPressed: () {
                        setState(() => isHover = false);
                        launchUrl(Uri.parse(widget.projectModel.live));
                      },
                      child: const Text('LIVE DEMO'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
