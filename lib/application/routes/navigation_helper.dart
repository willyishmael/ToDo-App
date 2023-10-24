import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/application/pages/home/home_page.dart';
import 'package:todo_app/application/routes/get_page.dart';
import 'package:todo_app/application/routes/go_router_observer.dart';
import 'package:todo_app/application/routes/paths.dart';

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();
  static NavigationHelper get instance => _instance;

  static late final GoRouter router;

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  factory NavigationHelper() {
    return _instance;
  }

  NavigationHelper._internal() {
    final routes = [
      GoRoute(
        path: Paths.rootPath,
        pageBuilder: (context, state) => getPage(
          child: const HomePage(),
          state: state,
        ),
      ),
      GoRoute(
        path: Paths.homePath,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: Paths.settingsPath,
        builder: (context, state) => const Placeholder(),
      ),
    ];

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Paths.homePath,
      observers: [GoRouterObserver()],
      routes: routes,
    );
  }
}
