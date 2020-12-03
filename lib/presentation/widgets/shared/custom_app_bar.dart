import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/home/widgets.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

const TOOLBAR_HEIGHT = kToolbarHeight * 1.25;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
    this.appId,
    this.apps, {
    Key? key,
  }) : super(key: key);

  final String? appId;
  final Map<String, KillerGamesApp> apps;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isDesktop = responsive.isDesktop;
    return SliverAppBar(
      toolbarHeight: TOOLBAR_HEIGHT,
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: AppName(onPrimary: false),
      centerTitle: true,
      actions: [
        if (isDesktop)
          for (final entry in apps.entries)
            SelectAppButton(
              appId: entry.key,
              app: entry.value,
              isSelected: entry.key == appId,
            ),
        if (!isDesktop)
          IconButton(
            icon: Icon(FeatherIcons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        SizedBox(width: Responsive.contentPadding(context).right),
      ],
    );
  }
}
