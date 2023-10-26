import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/application/pages/home/home_page.dart';
import 'package:todo_app/application/pages/root/root_page.dart';
import 'package:todo_app/application/pages/settings/settings_page.dart';
import 'package:todo_app/application/pages/tasks/tasks_page.dart';
import 'package:todo_app/application/core/wrap_with_material_page.dart';
import 'package:todo_app/application/routes/go_router_observer.dart';
import 'package:todo_app/application/routes/paths.dart';

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();
  static NavigationHelper get instance => _instance;

  static late final GoRouter router;

  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> homeNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  final GlobalKey<NavigatorState> tasksNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'tasks');
  final GlobalKey<NavigatorState> settingsNavigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'settings');

  factory NavigationHelper() {
    return _instance;
  }

  NavigationHelper._internal() {
    final routes = <RouteBase>[
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return wrapWithMaterialPage(
            child: RootPage(child: navigationShell),
            state: state,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigationKey,
            routes: [
              GoRoute(
                name: 'home',
                path: Paths.homePath,
                pageBuilder: (context, state) => wrapWithMaterialPage(
                  child: const HomePage(),
                  state: state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: tasksNavigationKey,
            routes: [
              GoRoute(
                path: Paths.tasksPath,
                pageBuilder: (context, state) => wrapWithMaterialPage(
                  child: const TasksPage(),
                  state: state,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsNavigationKey,
            routes: [
              GoRoute(
                path: Paths.settingsPath,
                pageBuilder: (context, state) => wrapWithMaterialPage(
                  child: const SettingsPage(),
                  state: state,
                ),
              ),
            ],
          ),
        ],
      ),
    ];

    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: Paths.homePath,
      observers: [GoRouterObserver()],
      routes: routes,
    );
  }
}
