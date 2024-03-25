import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:portfolio_frontend/controllers/language_controller.dart';
import 'package:portfolio_frontend/core/providers/providers.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (controller) {
      return Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 82),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sanjarbek S.'.tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavbarButton(context: context, text: 'Home'.tr, selected: 0),
                  const SizedBox(width: 30),
                  NavbarButton(context: context, text: 'About'.tr, selected: 1),
                  const SizedBox(width: 30),
                  NavbarButton(context: context, text: 'SkillSet'.tr, selected: 2),
                  const SizedBox(width: 30),
                  NavbarButton(context: context, text: 'Projects'.tr, selected: 3),
                  const SizedBox(width: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    color: const Color(0xFF5221E6),
                    child: NavbarButton(context: context, text: 'Contact'.tr, selected: 4),
                  ),
                  const SizedBox(width: 30),
                  DropdownButton(
                    value: controller.locale,
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400),
                    items: controller.languages
                        .map((language) => DropdownMenuItem(
                              value: Locale(language.languageCode, language.countryCode),
                              child: Text(
                                language.countryCode,
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400),
                              ),
                            ))
                        .toList(),
                    onChanged: (language) {
                      controller.setLanguage(Locale(language!.languageCode, language.countryCode));

                      // update models
                      context.read<ProjectProvider>().resetStatus();
                      context.read<SkillsetProvider>().resetStatus();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    super.key,
    required this.context,
    required this.text,
    required this.selected,
  });

  final BuildContext context;
  final String text;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<PageIndexProvider>(context, listen: false).setPageIndex(selected);
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400),
      ),
    );
  }
}
