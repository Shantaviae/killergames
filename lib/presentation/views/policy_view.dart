import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
import 'package:killergames/presentation/views/error_view.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class PolicyView extends StatelessWidget {
  const PolicyView(this.policyPath, {Key? key}) : super(key: key);

  final String policyPath;

  @override
  Widget build(BuildContext context) {
    final state = context.select((PolicyViewModel vm) => vm.state);

    if (state.stateType.isInitial) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    final policy = state.policies[policyPath];
    if (policy == null) {
      //If user provides a policy path that doesn't match with the paths of the
      //loaded policies, show error message and option to return home.
      return ErrorView(
        errorMessage: AppLocals.error404,
        showDrawer: false,
        policies: state.policies,
        resetButtonLabel: AppLocals.returnHome,
        onReset: () => RouteDelegate.openApp(context, null),
      );
    } else {
      final contentPadding = Responsive.contentPadding(context);
      return SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: contentPadding,
                  child: Text('${policy.title}'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: contentPadding,
                  child: Text('${policy.description}'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: contentPadding,
                  child: Text('${policy.content}'),
                ),
              ),
              CustomAppFooter(state.policies),
            ],
          ),
        ),
      );
    }
  }
}
