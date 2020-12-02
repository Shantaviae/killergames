import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/home/widgets.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

const TOOLBAR_HEIGHT = kToolbarHeight * 1.25;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.selectedAppId,
    required this.appData,
    Key? key,
  }) : super(key: key);

  final AppId selectedAppId;
  final Map<AppId, KillerGamesApp> appData;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isDesktop = responsive.isDesktop;
    return SliverAppBar(
      toolbarHeight: TOOLBAR_HEIGHT,
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Text(
        'Killer Games'.toUpperCase(),
        style: ThemeManager.appTitle(context),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      actions: [
        if (isDesktop)
          for (final entry in appData.entries)
            SelectAppButton(
              appId: entry.key,
              app: entry.value,
              isSelected: entry.key == selectedAppId,
            ),
        if (!isDesktop)
          IconButton(
            icon: Icon(FeatherIcons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        const SizedBox(width: PADDING),
      ],
    );
  }
}
