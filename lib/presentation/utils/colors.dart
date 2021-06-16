import 'package:flutter/material.dart';

class AppColors {
  // static const Color primaryColor = Color(0xff168AAD);
  static Color secondaryLightColor = Colors.blueGrey.shade200;
  static const Color primaryColor = Color(0xff892cdc);

  static const Color secondaryColor = Color(0xff1a1a2e);
  static const Color backgroundColor = Color(0xff000000);

  static Color getSecondaryColor() {
    return secondaryColor;
  }

  static Color getPrimaryColor() {
    return primaryColor;
  }

  static Color getBackgroundColor() {
    return backgroundColor;
  }
}
