import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
import 'package:killergames/presentation/widgets/home/widgets.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({this.appId, Key? key}) : super(key: key);

  final AppId? appId;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void didUpdateWidget(covariant HomeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.appId != null) {
      context.homeVM.setAppId(widget.appId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((HomeViewModel vm) => vm.state);
    final selectedApp = state.selectedApp;

    if (selectedApp == null) {
      return Container();
    } else {
      return SafeArea(
        child: Scaffold(
          drawer: CustomAppDrawer(
            appData: state.appData,
            selectedAppId: state.selectedAppId,
          ),
          body: Center(
            child: SizedBox(
              width: Responsive.screenWidth(context),
              child: CustomScrollView(
                slivers: [
                  CustomAppBar(
                    appData: state.appData,
                    selectedAppId: state.selectedAppId,
                  ),
                  AppInfoHero(selectedApp.appIntroHero),
                  for (final appContent in selectedApp.content)
                    AppContentHero(appContent),
                  ReviewsSection(reviews: selectedApp.reviews),
                  FaqSection(faqs: selectedApp.faqs),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
