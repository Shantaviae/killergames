import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer(
    this.appId,
    this.apps, {
    Key? key,
  }) : super(key: key);

  final String? appId;
  final Map<String, KillerGamesApp> apps;

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
              child: AppName(),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          for (final entry in apps.entries)
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: PADDING / 2,
                right: PADDING,
              ),
              title: Text(entry.value.name, style: textTheme.subtitle1),
              minLeadingWidth: 4,
              leading: Container(
                width: 4,
                color: appId == entry.key ? color : Colors.transparent,
              ),
              onTap: () {
                Navigator.pop(context);
                RouteDelegate.openApp(context, entry.key);
              },
            ),
        ],
      ),
    );
  }
}
