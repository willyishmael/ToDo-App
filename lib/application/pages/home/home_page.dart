import 'package:flutter/material.dart';
import 'package:todo_app/application/routes/navigation_helper.dart';
import 'package:todo_app/application/routes/paths.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: () => NavigationHelper.router.go(Paths.settingsPath),
              child: const Text('Go to Settings'),
            )
          ],
        ),
      ),
    );
  }
}
