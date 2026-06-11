import 'package:flutter/material.dart';

class Responsive {

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 700;
  }

  static bool isTablet(BuildContext context) {
    return false;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }
}