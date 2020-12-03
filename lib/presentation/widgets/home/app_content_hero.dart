import 'package:flutter/material.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/home/app_content_stack_hero.dart';
import 'package:killergames/presentation/widgets/home/app_content_single_hero.dart';

class AppContentHero extends StatelessWidget {
  const AppContentHero(this.appContent, {Key? key}) : super(key: key);

  final AppContent appContent;

  @override
  Widget build(BuildContext context) {
    if (appContent.screenshots.length == 1) {
      return AppContentSingleHero(appContent);
    } else if (appContent.screenshots.length == 2) {
      return AppContentStackedHero(appContent);
    } else {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }
}
