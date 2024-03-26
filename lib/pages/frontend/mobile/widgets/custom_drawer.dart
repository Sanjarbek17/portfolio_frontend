import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:portfolio_frontend/controllers/language_controller.dart';
import 'package:portfolio_frontend/core/style/colors.dart';

import 'custom_navbar_widget.dart';
import 'local_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LocalizationController localization = Get.find<LocalizationController>();
    return Drawer(
      backgroundColor: background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavbarButton(context: context, text: 'Home'.tr, selected: 0),
            const SizedBox(width: 30),
            NavbarButton(context: context, text: 'About'.tr, selected: 1),
            const SizedBox(width: 30),
            NavbarButton(context: context, text: 'SkillSet'.tr, selected: 2),
            const SizedBox(width: 30),
            NavbarButton(context: context, text: 'Projects'.tr, selected: 3),
            const SizedBox(width: 30),
            NavbarButton(context: context, text: 'Contact'.tr, selected: 4),
            const SizedBox(width: 30),
            Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: localization.languages
                    .map(
                      (language) => LocalText(
                        text: language.imageUrl,
                        isSelected: localization.selectedIndex == localization.languages.indexOf(language) ? true : false,
                        onPressed: () {
                          localization.setLanguage(Locale(language.languageCode, language.countryCode));
                          localization.setSelectedIndex(localization.languages.indexOf(language));

                          // Navigator.pop(context);
                        },
                      ),
                    )
                    .toList())
          ],
        ),
      ),
    );
  }
}
