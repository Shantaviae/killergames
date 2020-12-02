import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class AppGameplayHero extends StatelessWidget {
  const AppGameplayHero(this.gameplay, {Key? key}) : super(key: key);

  final AppGameplay gameplay;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isDesktop = responsive.isDesktop;
    final isTablet = responsive.isTablet;
    final isMobile = Responsive(context).isMobile;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? PADDING * 2 : PADDING * 5,
          horizontal: PADDING * 1.5,
        ),
        child: Row(
          children: [
            if (isDesktop) const SizedBox(width: PADDING * 3),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? PADDING * 4 : 0,
                ),
                child: Column(
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Text(
                      gameplay.name,
                      style: ThemeManager.heroHeader(context),
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                    ),
                    SizedBox(height: isDesktop ? PADDING * 2 : PADDING),
                    Text(
                      gameplay.description,
                      style: ThemeManager.heroSubheader(context),
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                    ),
                    if (!isDesktop) const SizedBox(height: PADDING * 2),
                    if (!isDesktop) _ImageScreenshot(gameplay.gameplayVisual),
                  ],
                ),
              ),
            ),
            if (isDesktop)
              Expanded(
                child: _ImageScreenshot(gameplay.gameplayVisual),
              ),
          ],
        ),
      ),
    );
  }
}

class _ImageScreenshot extends StatelessWidget {
  const _ImageScreenshot(
    this.imagePath, {
    Key? key,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive(context).isMobile;
    return Container(
      height: isMobile ? 350 : 450,
      child: ClipRRect(
        borderRadius: RADIUS * 4,
        child: Image.asset(imagePath),
      ),
    );
  }
}
