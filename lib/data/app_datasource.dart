// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/foundation.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/data/graph_ql_datasource.dart';
import 'package:killergames/domain/entities/entities.dart';

class AppDatasource extends GraphQLDatasource {
  AppDatasource() : super(query: _allAppsQuery, root: 'apps');

  Future<Map<String, KillerGamesApp>> fetchApps() async {
    final data = await fetchData<KillerGamesApp>(
      converter: (data) => toAppEntity(data),
      // testData: PlaceholderData.apps,
    );
    return {for (final app in data) app.id: app};
  }

  @visibleForTesting
  static KillerGamesApp toAppEntity(dynamic data) {
    final storeLinks = data['appStoreLinks'] as List<dynamic>;
    return KillerGamesApp(
      id: data['id'],
      name: data['name'],
      slogan: data['slogan'],
      headerImage: data['headerImage']['url'],
      appleStoreUrl: _getStringMatch(storeLinks, APPLE_STORE_DOMAIN),
      googlePlayStoreUrl: _getStringMatch(storeLinks, GOOGLE_STORE_DOMAIN),
      content: _toContentEntities(data),
      reviews: _toReviewEntities(data),
      faqs: _toFaqEntities(data),
      socialMedias: _toSocialMediaEntities(data),
    );
  }

  static List<AppContent> _toContentEntities(dynamic data) {
    final contents = <AppContent>[];
    for (final content in data['contents']) {
      final screenshots = <String>[
        for (final json in content['screenshots']) json['url']
      ];
      contents.add(AppContent(
        title: content['title'],
        description: content['description']['html'],
        screenshots: screenshots,
      ));
    }
    return contents;
  }

  static List<AppReview> _toReviewEntities(Map<String, dynamic> data) {
    final reviews = <AppReview>[];
    for (final review in data['reviews']) {
      reviews.add(AppReview(
        userFullname: review['userFullname'],
        appReviewDescription: review['review'],
        rating: review['rating'],
      ));
    }
    return reviews;
  }

  static List<FrequentlyAskedQuestion> _toFaqEntities(
      Map<String, dynamic> data) {
    final faqs = <FrequentlyAskedQuestion>[];
    for (final faq in data['faqs']) {
      faqs.add(FrequentlyAskedQuestion(
        question: faq['question'],
        answer: faq['answer']['html'],
      ));
    }
    return faqs;
  }

  static List<SocialMedia> _toSocialMediaEntities(Map<String, dynamic> data) {
    final socialMedias = <SocialMedia>[];
    for (final socialMedia in data['socialAcounts']) {
      socialMedias.add(SocialMedia(
        url: socialMedia['url'],
        type: socialMedia['type'],
      ));
    }
    return socialMedias;
  }

  static String? _getStringMatch(List<dynamic> list, String substring) {
    final matches = list.where((l) => l.contains(substring));
    return matches.isEmpty ? null : matches.first;
  }
}

const String _allAppsQuery = r'''
query AllKillerGames {
  apps(stage: PUBLISHED, orderBy: updatedAt_DESC, where: {appType: KillerGame}) {
    id
    name
    slogan
    appStoreLinks
    appType
    headerImage {
      url
    }
    contents {
      title
      description {
        html
      }
      screenshots {
        url
      }
    }
    reviews {
      userFullname
      review
      rating
    }
    faqs {
      question
      answer {
        html
      }
    }
    socialAcounts {
      url
      type
    }
  }
}
''';
