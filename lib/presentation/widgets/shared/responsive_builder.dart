import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';

typedef WidgetBuilder = Widget Function(BuildContext);

/// Contains sizing information to make responsive choices for the current screen
class Responsive {
  factory Responsive(BuildContext context) =>
      Responsive._(_getScreenType(context));

  Responsive._(this.screenType);
  final ScreenType screenType;

  bool get isMobile => screenType == ScreenType.Mobile;
  bool get isTablet => screenType == ScreenType.Tablet;
  bool get isDesktop => screenType == ScreenType.Desktop;
  bool get isWatch => screenType == ScreenType.Watch;
  bool get isDesktopOrTablet =>
      screenType == ScreenType.Desktop || screenType == ScreenType.Tablet;

  @override
  String toString() => 'ScreenType:$screenType';

  static ScreenType _getScreenType(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final deviceWidth = kIsWeb ? screenSize.width : screenSize.shortestSide;
    // If no user defined definitions are passed through use the defaults
    if (deviceWidth >= 950) {
      return ScreenType.Desktop;
    } else if (deviceWidth >= 600) {
      return ScreenType.Tablet;
    } else if (deviceWidth < 300) {
      return ScreenType.Watch;
    } else {
      return ScreenType.Mobile;
    }
  }

  static double screenWidth(BuildContext context, [double maxWidth = 1440]) =>
      min(MediaQuery.of(context).size.width, maxWidth);
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets contentPadding(
    BuildContext context, [
    double? contentWidth,
  ]) {
    final size = MediaQuery.of(context).size;
    final width = contentWidth ?? screenWidth(context);
    return EdgeInsets.symmetric(
      horizontal: (size.width - width) / 2,
      vertical: PADDING * 2,
    );
  }
}

/// A widget with a builder that provides you with the sizingInformation
///
/// This widget is used by the ScreenTypeLayout to provide different widget builders
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobilePortrait,
    required this.mobileLandscape,
    required this.desktopPortrait,
    required this.desktopLandscape,
    required this.tabletPortrait,
    required this.tabletLandscape,
    this.watch,
    Key? key,
  }) : super(key: key);

  final WidgetBuilder mobilePortrait;
  final WidgetBuilder tabletPortrait;
  final WidgetBuilder desktopPortrait;
  final WidgetBuilder mobileLandscape;
  final WidgetBuilder tabletLandscape;
  final WidgetBuilder desktopLandscape;
  final WidgetBuilder? watch;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = Responsive(context);
        final orientation = MediaQuery.of(context).orientation;
        final isLandscape = orientation == Orientation.landscape;
        if (responsive.isDesktop && isLandscape) {
          return desktopLandscape(context);
        } else if (responsive.isDesktop && !isLandscape) {
          return desktopPortrait(context);
        } else if (responsive.isTablet && isLandscape) {
          return tabletLandscape(context);
        } else if (responsive.isTablet && !isLandscape) {
          return tabletPortrait(context);
        } else if (responsive.isWatch && watch != null) {
          return watch != null ? watch!(context) : Container();
        } else if (isLandscape) {
          return mobileLandscape(context);
        } else {
          return mobilePortrait(context);
        }
      },
    );
  }
}
