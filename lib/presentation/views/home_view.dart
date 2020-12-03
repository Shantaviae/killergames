import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
import 'package:killergames/presentation/views/error_view.dart';
import 'package:killergames/presentation/widgets/home/widgets.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView(this.appId, {Key? key}) : super(key: key);

  final String? appId;

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
        apps: homeState.apps,
        policies: policyState.policies,
        resetButtonLabel: AppLocals.returnHome,
        onReset: () => context.homeVM.initialize(),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          drawer: CustomAppDrawer(appId, homeState.apps),
          body: CustomScrollView(
            slivers: [
              CustomAppBar(appId, homeState.apps),
              AppInfoHero(selectedApp),
              for (final appContent in selectedApp.content)
                AppContentHero(appContent),
              ReviewsSection(reviews: selectedApp.reviews),
              FaqSection(faqs: selectedApp.faqs),
              CustomAppFooter(policyState.policies),
            ],
          ),
        ),
      );
    }
  }
}
