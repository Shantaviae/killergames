import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/domain/data/data.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/core/core.dart';

extension HomeBuildContext on BuildContext {
  HomeViewModel get homeVM => read<HomeViewModel>();
}

class HomeState {
  HomeState.data([AppId? appId])
      : appData = AppData.apps,
        selectedAppId = appId ?? AppId.values.first;

  final Map<AppId, KillerGamesApp> appData;
  final AppId selectedAppId;

  KillerGamesApp? get selectedApp => appData[selectedAppId];

  HomeState copyWith(AppId appId) => HomeState.data(appId);
}

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeState.data());

  void setAppId(AppId id) {
    if (state.appData.containsKey(id)) {
      emit(state.copyWith(id));
    }
  }
}
