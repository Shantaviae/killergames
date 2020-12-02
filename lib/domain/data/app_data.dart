import 'package:killergames/domain/data/resources/resources.dart';
import 'package:killergames/domain/entities/app_entity.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/core/core.dart';

class AppData {
  static Map<AppId, KillerGamesApp> get apps {
    return {
      AppId.Killer2048: KillerGamesApp(
        appIntroHero: AppInfo(
          appName: 'Killer2048',
          appSlogan: StringRes.slogan2048,
          googlePlayStoreId: '',
          appleStoreId: 'app.killergames.killer2048',
          largeAbstractAppImage: ImageRes.largeAbstract2048,
        ),
        content: [
          AppGameplay(
            gameplayName: '2048 with a Twist',
            gameplayDescription: StringRes.gameplay2048Summary,
            gameplayVisual: ImageRes.gameplay2048Gif,
          ),
          AppFeature(
            featureName: 'Multiple Leaderboards',
            featureDescription: StringRes.feature2048OneLeaderboards,
            featureScreenshotA: ImageRes.feature2048One,
            featureScreenshotB: ImageRes.feature2048Two,
          ),
          AppFeature(
            featureName: 'Multiple Devices',
            featureDescription: StringRes.feature2048TwoDevices,
            featureScreenshotA: ImageRes.feature2048Two,
            featureScreenshotB: ImageRes.feature2048Two,
          ),
        ],
        faqs: [
          FrequentlyAskedQuestion(
            question: StringRes.question2048One,
            answer: StringRes.answer2048One,
          ),
          FrequentlyAskedQuestion(
            question: StringRes.question2048Two,
            answer: StringRes.answer2048Two,
          ),
          FrequentlyAskedQuestion(
            question: StringRes.question2048Three,
            answer: StringRes.answer2048Three,
            links: [
              Link(name: 'test', url: 'https://google.com'),
            ],
          ),
        ],
        reviews: [
          AppReview(
            userFullname: 'Dan J.',
            appReviewDescription:
                'I would gladly pay for an ad-free version. Just sayin\'.',
            rating: 5,
          ),
          AppReview(
            userFullname: 'Samantha E.',
            appReviewDescription:
                'Very smooth and challenging. Really enjoy this!! Also, it helps me calm down by taking my mind off for a bit when I feel anxious. I appreciate that a lot.',
            rating: 5,
          ),
          AppReview(
            userFullname: 'Peter R.',
            appReviewDescription:
                'Smooth, effortless play. I used to cure when my fat fingers made a strong move, but the 1-level Undo solved that. A pleasure to play.',
            rating: 5,
          ),
          AppReview(
            userFullname: 'Ellis F.',
            appReviewDescription:
                'A very good game which is very very user friendly, clever with high playability that you want to play again and again, at least until you reach 2048 aim.',
            rating: 5,
          ),
        ],
      ),
      AppId.Test: KillerGamesApp(
        appIntroHero: AppInfo(
          appName: 'Killer2048 Test',
          appSlogan: StringRes.slogan2048,
          googlePlayStoreId: 'app.killergames.killer2048',
          appleStoreId: 'app.killergames.killer2048',
          largeAbstractAppImage: ImageRes.largeAbstract2048,
        ),
        content: [
          AppGameplay(
            gameplayName: '2048 with a Twist',
            gameplayDescription: StringRes.gameplay2048Summary,
            gameplayVisual: ImageRes.gameplay2048Gif,
          ),
          AppFeature(
            featureName: 'Multiple Leaderboards',
            featureDescription: StringRes.feature2048OneLeaderboards,
            featureScreenshotA: ImageRes.feature2048One,
            featureScreenshotB: ImageRes.feature2048Two,
          ),
          AppFeature(
            featureName: 'Multiple Devices',
            featureDescription: StringRes.feature2048TwoDevices,
            featureScreenshotA: ImageRes.feature2048Two,
            featureScreenshotB: ImageRes.feature2048Two,
          ),
        ],
        faqs: [
          FrequentlyAskedQuestion(
            question: StringRes.question2048One,
            answer: StringRes.answer2048One,
          ),
          FrequentlyAskedQuestion(
            question: StringRes.question2048Two,
            answer: StringRes.answer2048Two,
          ),
          FrequentlyAskedQuestion(
            question: StringRes.question2048Three,
            answer: StringRes.answer2048Three,
          ),
        ],
        reviews: [
          AppReview(
            userFullname: 'Dan J.',
            appReviewDescription:
                'I would gladly pay for an ad-free version. Just sayin\'.',
            rating: 5,
          ),
          AppReview(
            userFullname: 'Samantha E.',
            appReviewDescription:
                'Very smooth and challenging. Really enjoy this!! Also, it helps me calm down by taking my mind off for a bit when I feel anxious. I appreciate that a lot.',
            rating: 5,
          ),
          AppReview(
            userFullname: 'Peter R.',
            appReviewDescription:
                'Smooth, effortless play. I used to cure when my fat fingers made a strong move, but the 1-level Undo solved that. A pleasure to play.',
            rating: 5,
          ),
          AppReview(
            userFullname: 'Ellis F.',
            appReviewDescription:
                'A very good game which is very very user friendly, clever with high playability that you want to play again and again, at least until you reach 2048 aim.',
            rating: 5,
          ),
        ],
      ),
    };
  }
}
