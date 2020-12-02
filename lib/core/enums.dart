import 'package:killergames/core/app_locals.dart';

enum ScreenType { Mobile, Tablet, Desktop, Watch }

enum PolicyType { TermsOfService, PrivacyPolicy }

enum ViewModelState { Initial, Loaded }

extension PolicyTypeX on PolicyType {
  String get title {
    switch (this) {
      case PolicyType.PrivacyPolicy:
        return AppLocals.privacyPolicy;
      case PolicyType.TermsOfService:
        return AppLocals.termsOfServicePolicy;
      default:
        return AppLocals.genericPolicy;
    }
  }
}

enum AppId { Killer2048, Test }

extension AppIdX on AppId {
  String get pathName => '/${toString().split('.').last}';
}
