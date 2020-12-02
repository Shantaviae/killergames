import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/views/views.dart';

///
///Manages the navigation routes for the application.
///
///The [generateRoute] method informs the [MaterialApp]
///on which View should be pushed onto the stack based on
///the named route that is provided.
class RouteDelegate {
  static const String home = '/';
  static const String termsOfService = '/terms_of_service';
  static const String privacyPolicy = '/privacy_policy';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => HomeView(),
        );
      case termsOfService:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => PolicyView(PolicyType.TermsOfService),
        );
      case privacyPolicy:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => PolicyView(PolicyType.PrivacyPolicy),
        );
      default:
        final path = settings.name;
        final pathNames = AppId.values.map((id) => id.pathName).toList();
        if (pathNames.contains(path)) {
          final appId = AppId.values.firstWhere((id) => id.pathName == path);
          return MaterialPageRoute(
            settings: RouteSettings(name: settings.name),
            builder: (_) => HomeView(appId: appId),
          );
        }
        return MaterialPageRoute(
          settings: RouteSettings(name: '404'),
          builder: (_) => ErrorView(),
        );
    }
  }
}
