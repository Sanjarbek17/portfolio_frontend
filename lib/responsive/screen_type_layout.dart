import 'package:flutter/material.dart';
import 'package:portfolio_frontend/enums/device_screen_type.dart';
import 'package:portfolio_frontend/responsive/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  // mobile will be returned by default
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // If sizing indicates tablet and we have a tablet widget then return
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          if (tablet != null) {
            return tablet as Widget;
          }
        }

        // If sizing indicates desktop and we have a desktop widget then return
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          if (desktop != null) {
            return desktop as Widget;
          }
        }

        // Return mobile layout if nothing else is supplied
        return mobile;
      },
    );
  }
}
