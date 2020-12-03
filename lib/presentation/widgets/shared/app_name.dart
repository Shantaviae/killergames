import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';

class AppName extends StatelessWidget {
  const AppName({
    this.onPrimary = true,
    Key? key,
  }) : super(key: key);

  final bool onPrimary;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Killer Games'.toUpperCase(),
      style: ThemeManager.appTitle(context, onPrimary: onPrimary),
    );
  }
}
