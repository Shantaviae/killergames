import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/data/datasources.dart';
import 'package:killergames/domain/entities/entities.dart';

extension PolicyBuildContext on BuildContext {
  PolicyViewModel get policyVM => read<PolicyViewModel>();
}

class PolicyViewModel extends Cubit<PolicyState> {
  PolicyViewModel([PolicyDatasource? datasource])
      : datasource = datasource ?? GetIt.instance<PolicyDatasource>(),
        super(PolicyState());

  final PolicyDatasource datasource;

  Future<void> initialize() async {
    final policies = await datasource.fetchPolicies();
    emit(PolicyState(policies: policies, stateType: StateType.Loaded));
  }
}

class PolicyState {
  PolicyState({
    this.policies = const {},
    this.stateType = StateType.Initial,
  });

  final Map<String, AppPolicy> policies;
  final StateType stateType;
}
