import 'package:get_it/get_it.dart';
import 'package:killergames/data/datasources.dart';

class LocatorService {
  static final ls = GetIt.instance;

  ///Instantiate global services (i.e. usecases, repositories, datasources, etc)
  ///at the root of the MyApp tree.
  static Future<void> initialize() async {
    // //Internal APIs

    // //External APIs
    // ls.registerLazySingleton(() => FirebaseAnalytics());
    // ls.registerLazySingleton(() => FirebaseCrashlytics.instance);
    // ls.registerLazySingleton(() => FirebasePerformance.instance);
    // ls.registerLazySingleton(() => FirebaseAdMob.instance);
    // ls.registerLazySingleton(() => FirebaseAuth.instance);
    // ls.registerLazySingleton(() => RewardedVideoAd.instance);
    // ls.registerLazySingleton(() => InAppReview.instance);

    //Backend Datasources & API Interfaces
    ls.registerLazySingleton(() => PolicyDatasource());
    ls.registerLazySingleton(() => AppDatasource());
    // ls.registerLazySingleton(() => GamesDatasourse());
    // ls.registerLazySingleton(() => GamesServices());
    // ls.registerLazySingleton(() => AuthManager());

    // //Services
    // ls.registerLazySingleton(() => RemoteConfigService());
    // ls.registerLazySingleton(() => AnalyticsService());
    // ls.registerLazySingleton(() => InAppReviewService());
    // ls.registerLazySingleton(() => InAppPurchasesService());
    // ls.registerLazySingleton(() => AdService());

    // ///Business Logic
    // ls.registerLazySingleton(() => GameBloc());
    // ls.registerLazySingleton(() => AppInfoBloc());

    // //Repositories
    // ls.registerLazySingleton(() => GamesRepository());
    // ls.registerLazySingleton(() => UserRepository());
  }
}
