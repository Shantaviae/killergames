import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';

class SelectAppButton extends StatelessWidget {
  const SelectAppButton({
    required this.appId,
    required this.setAppId,
    required this.app,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final String appId;
  final Function(String) setAppId;
  final KillerGamesApp app;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = textTheme.headline6?.color ?? Colors.black;
    return TextButton(
      onPressed: () => setAppId(appId),
      child: AnimatedContainer(
        duration: ANIMATION,
        curve: CURVE,
        padding: const EdgeInsets.only(bottom: PADDING / 3),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: color.withOpacity(isSelected ? 1 : 0),
            ),
          ),
        ),
        child: Text(app.name, style: textTheme.subtitle1),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: PADDING,
        ),
      ),
    );
  }
}
