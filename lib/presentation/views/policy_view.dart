import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyView extends StatefulWidget {
  const PolicyView(this.policyType, {Key? key}) : super(key: key);

  final PolicyType policyType;

  @override
  _PolicyViewState createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  @override
  void didUpdateWidget(covariant PolicyView oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.policyVM.setPolicyType(widget.policyType);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((PolicyViewModel vm) => vm.state);
    final policy = state.selectedPolicy;
    if (policy == null) {
      return Container();
    } else {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text('${policy.policyName}'),
            ],
          ),
        ),
      );
    }
  }
}
