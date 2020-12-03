import 'package:flutter/material.dart';
import 'package:killergames/presentation/navigation/app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    print('parseRouteInformation'.toUpperCase());

    // Handle '/policy/policy_path'
    if (uri.pathSegments.length == 2) {
      final root = uri.pathSegments[0];
      final path = uri.pathSegments[1];
      if (root == 'policy') {
        return AppRoutePath.policy(path);
      } else {
        return AppRoutePath.home(null);
      }
    } else if (uri.pathSegments.isEmpty) {
      // Handle unknown routes
      return AppRoutePath.home(null);
    }

    // Handle '/appId=@id
    else if (uri.pathSegments[0].contains('appId=')) {
      final appId = uri.pathSegments[0].replaceAll(RegExp(r'appId='), '');
      return AppRoutePath.home(appId);
    } else {
      // Handle unknown routes
      return AppRoutePath.home(null);
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    print('restoreRouteInformation'.toUpperCase());
    if (path.hasActivePolicy) {
      return RouteInformation(location: '/policy/${path.policyPath}');
    } else {
      return RouteInformation(location: '/appId=${path.appId ?? ''}');
    }
  }
}
