//@dart = 2.9
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/view_models/view_models.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

void main() {
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData(isLight: true),
      darkTheme: ThemeManager.themeData(isLight: false),
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteDelegate.generateRoute,
      initialRoute: RouteDelegate.home,
    );
  }
}
