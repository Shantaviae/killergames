import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';

class KillerGamesLogo extends StatelessWidget {
  const KillerGamesLogo({
    this.padding = const EdgeInsets.symmetric(horizontal: PADDING),
    Key? key,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        'forbyus',
        style: Theme.of(context).textTheme.headline1,
        overflow: TextOverflow.clip,
        maxLines: 1,
      ),
    );
  }
}
