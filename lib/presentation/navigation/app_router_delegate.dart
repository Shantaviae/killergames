import 'package:flutter/material.dart';
import 'package:killergames/presentation/navigation/app_route_path.dart';
import 'package:killergames/presentation/views/views.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  AppRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _navigatorKey;

  String? _appId;
  String? _policyPath;

  AppRoutePath get currentPath => _policyPath != null
      ? AppRoutePath.policy(_policyPath!)
      : AppRoutePath.home(_appId);

  @override
  Widget build(BuildContext context) {
    print('AppRouterDelegate build'.toUpperCase());
    return Navigator(
      pages: [
        MaterialPage(
          child: HomeView(
            appId: currentPath.appId,
            setAppId: _setAppId,
            setPolicyPath: _setPolicyPath,
          ),
        ),
        if (currentPath.hasActivePolicy)
          MaterialPage(
              child: PolicyView(
            policyPath: _policyPath!,
            setPolicyPath: _setPolicyPath,
          )),
      ],
      onPopPage: (route, result) {
        //Check whether didPop fails before updating the app state
        if (!route.didPop(result)) {
          return false;
        }
        if (currentPath.hasActivePolicy) {
          _setPolicyPath(null);
        }
        return true;
      },
    );
  }

  void _setAppId(String? appId) {
    _appId = appId;
    notifyListeners();
  }

  void _setPolicyPath(String? policyPath) {
    _policyPath = policyPath;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    print('setNewRoutePath'.toUpperCase());
    if (path.hasActivePolicy) {
      _setPolicyPath(path.policyPath);
    } else {
      _setAppId(path.appId);
    }
  }
}
