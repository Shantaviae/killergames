import 'package:flutter/material.dart';
import 'package:killergames/presentation/views/views.dart';

///
///Manages the navigation routes for the application.
///
///The [generateRoute] method informs the [MaterialApp]
///on which View should be pushed onto the stack based on
///the named route that is provided.
class RouteDelegate {
  static const String home = '/';
  static const String preAppId = 'appId=';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '/');
    if (uri.pathSegments.isEmpty) {
      // Handle unknown routes
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (_) => HomeView(null),
      );
    } else if (uri.pathSegments.length == 2) {
      // Handle /policy/policy_path
      final root = uri.pathSegments[0];
      final path = uri.pathSegments[1];
      if (root == 'policy') {
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => PolicyView(path),
        );
      }
    } else if (uri.pathSegments[0].contains(preAppId)) {
      // Handle /appId=@id
      final appId = uri.pathSegments[0].replaceAll(RegExp(r'appId='), '');
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (_) => HomeView(appId),
      );
    }
    return MaterialPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (_) => HomeView(null),
    );
  }

  static Future<void> openApp(BuildContext context, String? appId) async {
    Navigator.pushNamed(context, appId == null ? home : '$home$preAppId$appId');
  }

  static Future<void> openPolicy(BuildContext context, String? path) async {
    Navigator.pushNamed(context, '/policy/${path ?? ''}');
  }
}
