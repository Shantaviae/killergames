import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class AppContentStackedHero extends StatelessWidget {
  const AppContentStackedHero(this.appContent, {Key? key}) : super(key: key);

  final AppContent appContent;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive(context).isDesktop;
    final isMobile = Responsive(context).isMobile;

    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: Responsive.screenWidth(context),
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? PADDING * 2 : PADDING * 5,
            horizontal: PADDING * 1.5,
          ),
          child: Row(
            children: [
              if (isDesktop)
                Expanded(
                  child: _LayeredScreenshots(appContent),
                ),
              if (isDesktop) const SizedBox(width: PADDING * 3),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 0 : PADDING * 4,
                  ),
                  child: Column(
                    crossAxisAlignment: isDesktop
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Text(
                        appContent.title,
                        style: ThemeManager.heroHeader(context),
                        textAlign:
                            isDesktop ? TextAlign.left : TextAlign.center,
                      ),
                      SizedBox(height: isDesktop ? PADDING * 2 : PADDING),
                      Text(
                        appContent.description,
                        style: ThemeManager.heroSubheader(context),
                        textAlign:
                            isDesktop ? TextAlign.left : TextAlign.center,
                      ),
                      if (!isDesktop) const SizedBox(height: PADDING * 2),
                      if (!isDesktop) _LayeredScreenshots(appContent),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LayeredScreenshots extends StatelessWidget {
  const _LayeredScreenshots(this.appContent, {Key? key}) : super(key: key);

  final AppContent appContent;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive(context).isMobile;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: isMobile ? 450 : 600,
          width: isMobile ? 450 : 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: RADIUS.bottomLeft * 50,
              bottomRight: RADIUS.bottomRight * 75,
              topLeft: RADIUS.topLeft * 75,
              topRight: RADIUS.topRight * 75,
            ),
            color: Theme.of(context).buttonColor.withOpacity(0.15),
          ),
        ),
        _ImageScreenshot(imagePath: appContent.screenshots[0], order: 2),
        _ImageScreenshot(imagePath: appContent.screenshots[1], order: 1),
      ],
    );
  }
}

class _ImageScreenshot extends StatelessWidget {
  const _ImageScreenshot({
    required this.imagePath,
    required this.order,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final int order;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive(context).isMobile;
    return Container(
      height: isMobile ? 400 : 550,
      margin: EdgeInsets.only(
        right: order == 1 ? 150 : 0,
        left: order == 2 ? 150 : 0,
        bottom: order == 1 ? 75 : 0,
        top: order == 2 ? 75 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: RADIUS * 8,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: RADIUS * 8,
        child: Image.network(imagePath),
      ),
    );
  }
}
