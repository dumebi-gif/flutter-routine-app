import 'package:flutter/material.dart';
import 'package:routine_app/core/constants/constants.dart';
import 'package:routine_app/core/routes/app_router.dart';
import 'package:routine_app/globals.dart';

void main() async {
  Globals.initialize();
  runApp(RoutineApp());
}

class RoutineApp extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const RoutineApp._internal();
  static const RoutineApp instance = RoutineApp._internal();

  factory RoutineApp() => instance;

  @override
  State<RoutineApp> createState() => _RoutineAppState();
}

class _RoutineAppState extends State<RoutineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: AppConstants.appName,
        theme: ThemeData(primarySwatch: Colors.pink),
        debugShowCheckedModeBanner: false,
        routeInformationParser: MyAppRouter.router.routeInformationParser,
        routerDelegate: MyAppRouter.router.routerDelegate,
        routeInformationProvider: MyAppRouter.router.routeInformationProvider,
        builder: (context, child) => child!);
  }
}
