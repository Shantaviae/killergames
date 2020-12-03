class KillerGamesApp {
  KillerGamesApp({
    required this.id,
    required this.name,
    required this.slogan,
    required this.googlePlayStoreUrl,
    required this.appleStoreUrl,
    required this.headerImage,
    required this.content,
    required this.faqs,
    required this.reviews,
    required this.socialMedias,
  });

  final String id;
  final String name;
  final String slogan;
  final String? googlePlayStoreUrl;
  final String? appleStoreUrl;
  final String headerImage;
  final List<AppContent> content;
  final List<FrequentlyAskedQuestion> faqs;
  final List<AppReview> reviews;
  final List<SocialMedia> socialMedias;

  String get path => '/$name';
}

class AppContent {
  AppContent({
    required this.title,
    required this.description,
    required this.screenshots,
  });
  final String title;
  final String description;
  final List<String> screenshots;
}

class FrequentlyAskedQuestion {
  FrequentlyAskedQuestion({
    required this.question,
    required this.answer,
  });
  final String question;
  final String answer;
}

class AppReview {
  AppReview({
    required this.userFullname,
    required this.appReviewDescription,
    required this.rating,
  });

  final String userFullname;
  final String appReviewDescription;
  final int rating;
}

class SocialMedia {
  SocialMedia({required this.url, required this.type});
  final String url;
  final String type;
}
