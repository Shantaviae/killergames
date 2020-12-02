import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/domain/data/data.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/core/core.dart';

extension PolicyBuildContext on BuildContext {
  PolicyViewModel get policyVM => read<PolicyViewModel>();
}

class PolicyState {
  PolicyState.data([PolicyType? policyType])
      : policyData = PolicyData.policies,
        selectedType = policyType ?? PolicyType.values.first;

  final Map<PolicyType, AppPolicy> policyData;
  final PolicyType selectedType;

  AppPolicy? get selectedPolicy => policyData[selectedType];

  PolicyState copyWith(PolicyType policyType) => PolicyState.data(policyType);
}

class PolicyViewModel extends Cubit<PolicyState> {
  PolicyViewModel() : super(PolicyState.data());

  void setPolicyType(PolicyType policyType) {
    if (state.policyData.containsKey(policyType)) {
      emit(state.copyWith(policyType));
    }
  }
}
