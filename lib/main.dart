//@dart = 2.9
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/navigation/navigation.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

void main() async {
  await LocatorService.initialize();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (_) => HomeViewModel()),
        BlocProvider(create: (_) => PolicyViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModel>().initialize();
    context.read<PolicyViewModel>().initialize();
  }

  final _routerDelegate = AppRouterDelegate();
  final _routeInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData(isLight: true),
      darkTheme: ThemeManager.themeData(isLight: false),
      themeMode: ThemeMode.light,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
