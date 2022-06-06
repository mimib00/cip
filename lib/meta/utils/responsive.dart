import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  static final Size _size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  // This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  static bool isStaticMobile = _size.width < 850;
  static bool isStaticTablet = _size.width < 1100 && _size.width >= 850;
  static bool isStaticDesktop = _size.width >= 1100;

  static Size designSize = isStaticMobile
      ? const Size(375, 812)
      : isStaticTablet
          ? const Size(597, 833)
          : const Size(1024, 833);

  static int intR(BuildContext context, {required int mobile, required int tablet, required int desktop}) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return desktop;
    }
  }

  static double doubleR(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop!;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile!;
    }
  }
}
