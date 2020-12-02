import 'package:killergames/domain/entities/faq_entity.dart';
import 'package:killergames/domain/entities/review_entity.dart';

class KillerGamesApp {
  KillerGamesApp({
    required this.appIntroHero,
    required this.content,
    required this.faqs,
    required this.reviews,
  })   : assert(content.length >= 1, 'Must have at least two content per app'),
        assert(faqs.length >= 2, 'Must have at least two FAQs per app'),
        assert(reviews.length >= 4, 'Must have at least four reviews per app');

  final AppInfo appIntroHero;
  final List<AppContent> content;
  final List<FrequentlyAskedQuestion> faqs;
  final List<AppReview> reviews;
}

class AppInfo {
  AppInfo({
    required this.appName,
    required this.appSlogan,
    required this.googlePlayStoreId,
    required this.appleStoreId,
    required this.largeAbstractAppImage,
  });

  final String appName;
  final String appSlogan;
  final String googlePlayStoreId;
  final String appleStoreId;
  final String largeAbstractAppImage;

  String get googlePlayStoreLink =>
      'https://play.google.com/store/apps/details?id=$googlePlayStoreId';
  String get appleStoreLink =>
      'https://play.google.com/store/apps/details?id=$appleStoreId';
}

abstract class AppContent {
  AppContent(this.name, this.description);
  final String name;
  final String description;
}

class AppFeature extends AppContent {
  AppFeature({
    required String featureName,
    required String featureDescription,
    required this.featureScreenshotA,
    required this.featureScreenshotB,
  }) : super(featureName, featureDescription);

  final String featureScreenshotA;
  final String featureScreenshotB;
}

class AppGameplay extends AppContent {
  AppGameplay({
    required String gameplayName,
    required String gameplayDescription,
    required this.gameplayVisual,
  }) : super(gameplayName, gameplayDescription);

  final String gameplayVisual;
}
