import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
import 'package:killergames/presentation/views/error_view.dart';
import 'package:killergames/presentation/widgets/home/widgets.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    required this.appId,
    required this.setAppId,
    required this.setPolicyPath,
    Key? key,
  }) : super(key: key);

  final String? appId;
  final Function(String) setAppId;
  final Function(String) setPolicyPath;

  @override
  Widget build(BuildContext context) {
    final homeState = context.select((HomeViewModel vm) => vm.state);
    final policyState = context.select((PolicyViewModel vm) => vm.state);

    if (homeState.stateType.isInitial) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    final selectedApp = homeState.apps[appId] ??
        (homeState.apps.isEmpty ? null : homeState.apps.values.first);
    if (selectedApp == null) {
      return ErrorView(
        errorMessage: AppLocals.error404,
        showDrawer: true,
        appId: appId,
        setAppId: setAppId,
        setPolicyPath: setPolicyPath,
        apps: homeState.apps,
        policies: policyState.policies,
        resetButtonLabel: AppLocals.returnHome,
        onReset: () => setAppId(homeState.apps.keys.first),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          drawer: CustomAppDrawer(appId, setAppId, homeState.apps),
          body: CustomScrollView(
            slivers: [
              CustomAppBar(appId, setAppId, homeState.apps),
              AppInfoHero(selectedApp),
              for (final appContent in selectedApp.content)
                AppContentHero(appContent),
              ReviewsSection(reviews: selectedApp.reviews),
              FaqSection(faqs: selectedApp.faqs),
              CustomAppFooter(policyState.policies, setPolicyPath),
            ],
          ),
        ),
      );
    }
  }
}
