import 'package:flutter/material.dart';
import 'package:portfolio_frontend/core/custom_widgets/not_supported.dart';
import 'package:portfolio_frontend/responsive/screen_type_layout.dart';

class FrotendPage extends StatelessWidget {
  const FrotendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: NotSupported(),
    );
  }
}
