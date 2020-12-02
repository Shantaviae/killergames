import 'package:flutter/material.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class AppInfoHero extends StatelessWidget {
  const AppInfoHero(this.appIntroHero, {Key? key}) : super(key: key);

  final AppInfo appIntroHero;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive(context).isDesktop;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? PADDING * 2.5 : PADDING * 1.5,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Image.asset(
                appIntroHero.largeAbstractAppImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: PADDING * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeroTitleDecoration(
                    child: Text(
                      appIntroHero.appName,
                      style: ThemeManager.heroHeader(context, onPrimary: true),
                    ),
                  ),
                  _HeroTitleDecoration(
                    child: Text(
                      appIntroHero.appSlogan,
                      style:
                          ThemeManager.heroSubheader(context, onPrimary: true),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroTitleDecoration extends StatelessWidget {
  const _HeroTitleDecoration({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.symmetric(vertical: PADDING),
      padding: const EdgeInsets.symmetric(
        horizontal: PADDING / 2,
        vertical: PADDING / 4,
      ),
      child: child,
    );
  }
}
