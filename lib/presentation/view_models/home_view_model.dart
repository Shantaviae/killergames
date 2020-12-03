import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/data/datasources.dart';
import 'package:killergames/domain/entities/entities.dart';

extension HomeBuildContext on BuildContext {
  HomeViewModel get homeVM => read<HomeViewModel>();
}

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel([AppDatasource? datasource])
      : datasource = datasource ?? GetIt.instance<AppDatasource>(),
        super(HomeState());

  final AppDatasource datasource;

  Future<void> initialize() async {
    final apps = await datasource.fetchApps();
    emit(HomeState(apps: apps, stateType: StateType.Loaded));
  }
}

class HomeState {
  HomeState({
    this.apps = const {},
    this.stateType = StateType.Initial,
  });

  final Map<String, KillerGamesApp> apps;
  final StateType stateType;
}
