import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({
    required this.selectedAppId,
    required this.appData,
    Key? key,
  }) : super(key: key);

  final AppId selectedAppId;
  final Map<AppId, KillerGamesApp> appData;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = textTheme.headline6?.color ?? Colors.black;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Killer Games Apps'.toUpperCase(),
                style: ThemeManager.appTitle(context, onPrimary: true),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          for (final entry in appData.entries)
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: PADDING / 2,
                right: PADDING,
              ),
              title: Text(
                entry.value.appIntroHero.appName,
                style: textTheme.subtitle1,
              ),
              minLeadingWidth: 4,
              leading: Container(
                width: 4,
                color: selectedAppId == entry.key ? color : Colors.transparent,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, entry.key.pathName);
              },
            ),
        ],
      ),
    );
  }
}
