import 'package:flutter/material.dart';
class ResponsiveUtils {
  ResponsiveUtils._();

  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1200;

  static double scale(BuildContext context, double size) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < mobileMaxWidth) {
      return size;
    } else if (screenWidth < tabletMaxWidth) {
      return size * 1.2;
    } else {
      return size * 1.5;
    }
  }

  static double getCarouselHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < mobileMaxWidth) {
      return 200;
    } else if (screenWidth < tabletMaxWidth) {
      return 250;
    } else {
      return 300;
    }
  }
}
