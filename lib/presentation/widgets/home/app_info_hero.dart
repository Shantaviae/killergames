import 'package:flutter/material.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class AppInfoHero extends StatelessWidget {
  const AppInfoHero(this.app, {Key? key}) : super(key: key);

  final KillerGamesApp app;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: Responsive.screenWidth(context),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Image.network(app.headerImage, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: PADDING * 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroTitleDecoration(
                      child: Text(
                        app.name,
                        style:
                            ThemeManager.heroHeader(context, onPrimary: true),
                      ),
                    ),
                    _HeroTitleDecoration(
                      child: Text(
                        app.slogan,
                        style: ThemeManager.heroSubheader(context,
                            onPrimary: true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
