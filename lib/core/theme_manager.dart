import 'package:flutter/material.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

const String FONT_FAMILY = 'OpenSans';
const String HEADER_FONT_FAMILY = 'Inter';

const MaterialColor _primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

///Manages Theme customizations across the application.
class ThemeManager {
  ///Returns customized ThemeData which gets applied to the app
  ///in the main.dart file. The ThemeData is based on the isDark
  ///flag which defaults to `false`.
  static ThemeData themeData({required bool isLight}) {
    final icon = IconThemeData(color: isLight ? Colors.black : Colors.white);
    return ThemeData(
      primarySwatch: _primaryBlack,
      primaryColor: _primaryBlack,
      accentColor: Colors.red,
      brightness: isLight ? Brightness.light : Brightness.dark,
      fontFamily: FONT_FAMILY,
      appBarTheme: AppBarTheme(iconTheme: icon),
      iconTheme: icon,
    );
  }

  static TextStyle? heroHeader(BuildContext context, {bool onPrimary = false}) {
    final isDesktop = Responsive(context).isDesktop;
    return appTitle(context, onPrimary: onPrimary)?.copyWith(
      fontSize: isDesktop ? 52 : 32,
    );
  }

  static TextStyle? appTitle(BuildContext context, {bool onPrimary = false}) {
    final isDesktop = Responsive(context).isDesktop;
    final textTheme = onPrimary
        ? Theme.of(context).primaryTextTheme
        : Theme.of(context).textTheme;
    return textTheme.headline5?.copyWith(
      fontFamily: HEADER_FONT_FAMILY,
      fontWeight: FontWeight.w800,
      fontSize: isDesktop ? 20 : 16,
      height: 1.1,
    );
  }

  static TextStyle? heroSubheader(BuildContext context,
      {bool onPrimary = false}) {
    final isDesktop = Responsive(context).isDesktop;
    final textTheme = onPrimary
        ? Theme.of(context).primaryTextTheme
        : Theme.of(context).textTheme;
    return textTheme.headline5?.copyWith(
      fontSize: isDesktop ? 24 : 18,
      height: 2,
    );
  }
}
