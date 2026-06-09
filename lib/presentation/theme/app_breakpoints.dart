import 'package:flutter/widgets.dart';

class AppBreakpoints {
  static const mobile = 800.0;
  static const desktop = 1200.0;
}

extension AppBreakpointsHelper on BuildContext {
  T onLayout<T>({required T Function() onMobile, required T Function() onTablet, required T Function() onDesktop}) {
    final width = MediaQuery.sizeOf(this).width;
    if (width < AppBreakpoints.mobile) return onMobile();
    if (width < AppBreakpoints.desktop) return onTablet();
    return onDesktop();
  }

  T onMobile<T>({required T Function() onMobile, required T Function() orElse}) =>
      onLayout(onMobile: onMobile, onTablet: orElse, onDesktop: orElse);

  bool isMobile() => onMobile(onMobile: () => true, orElse: () => false);
}
