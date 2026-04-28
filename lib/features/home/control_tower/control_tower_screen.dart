import 'package:flutter/material.dart';
import '../../../core/utils/responsive.dart';
import 'views/mobile_view.dart';
import 'views/desktop_view.dart';

class ControlTowerScreen extends StatelessWidget {
  const ControlTowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ControlTowerMobileView(),
      tablet: ControlTowerMobileView(),
      desktop: ControlTowerDesktopView(),
    );
  }
}