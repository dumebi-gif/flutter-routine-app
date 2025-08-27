import 'package:go_router/go_router.dart';
import 'package:routine_app/core/routes/route_names.dart';
import 'package:routine_app/main.dart';
import 'package:routine_app/src/home/home_page.dart';
import 'package:routine_app/src/profile/profile_page.dart';

class MyAppRouter {
  static GoRouter router =
      GoRouter(navigatorKey: RoutineApp.navigatorKey, routes: [
    GoRoute(
      name: RouteNames.initial,
      path: RouteNames.initial,
      builder: (context, state) => RoutineHomePage(),
    ),
    GoRoute(
      name: RouteNames.profile,
      path: RouteNames.profile,
      builder: (context, state) => ProfilePage(),
    ),
  ]);
}
