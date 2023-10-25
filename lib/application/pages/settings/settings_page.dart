import 'package:flutter/material.dart';
import 'package:todo_app/application/routes/navigation_helper.dart';
import 'package:todo_app/application/routes/paths.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Settings Page'),
            ElevatedButton(
              onPressed: () => NavigationHelper.router.go(Paths.homePath),
              child: const Text('Go to Home'),
            )
          ],
        ),
      ),
    );
  }
}
