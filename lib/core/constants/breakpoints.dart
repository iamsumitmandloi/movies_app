import 'package:flutter/material.dart';

class Breakpoints {
  static const double small = 375;
  static const double medium = 414;
  static const double large = 480;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < small;

  static bool isMedium(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= small && width < large;
  }

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= large;
}

class ResponsiveUtils {
  static int getGridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.medium) return 2;
    if (width < Breakpoints.large) return 2;
    return 3;
  }

  static double getCarouselHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.small) return 200;
    if (width < Breakpoints.medium) return 225;
    return 250;
  }

  static double getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.small) return 8;
    if (width < Breakpoints.medium) return 12;
    return 16;
  }
}
