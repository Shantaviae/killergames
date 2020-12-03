class AppRoutePath {
  final String? appId;
  final String? policyPath;

  AppRoutePath.home(String? appId)
      : appId = appId,
        policyPath = null;

  AppRoutePath.policy(String policyPath)
      : appId = null,
        policyPath = policyPath;

  bool get hasActivePolicy => policyPath != null;

  @override
  String toString() => 'AppRoutePath{appId: $appId, policyPath: $policyPath}';
}
