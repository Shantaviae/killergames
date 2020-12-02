import 'package:flutter/material.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/home/app_feature_hero.dart';
import 'package:killergames/presentation/widgets/home/app_gameplay_hero.dart';

class AppContentHero extends StatelessWidget {
  const AppContentHero(this.appContent, {Key? key}) : super(key: key);

  final AppContent appContent;

  @override
  Widget build(BuildContext context) {
    if (appContent is AppFeature) {
      return AppFeatureHero(appContent as AppFeature);
    } else if (appContent is AppGameplay) {
      return AppGameplayHero(appContent as AppGameplay);
    } else {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }
}
