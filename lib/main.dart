import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/application/routes/navigation_helper.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/theme.dart';

void main() {
  NavigationHelper.instance;
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp.router(
        title: 'Todo App',
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        routerConfig: NavigationHelper.router,
      );
    });
  }
}