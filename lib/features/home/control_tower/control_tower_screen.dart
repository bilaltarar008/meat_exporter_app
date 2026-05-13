import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive.dart';

import 'views/mobile_view.dart';
import 'views/desktop_view.dart';

class ControlTowerScreen extends StatelessWidget {
  const ControlTowerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    if (Responsive.isDesktop(context)) {
      return const ControlTowerDesktopView();
    }

    return const ControlTowerMobileView();
  }
}