import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      bottomNavigationBar: _getBottomNavigationBar(),
      body: const Placeholder(),
    );
  }

  NavigationBar _getBottomNavigationBar() {
    return NavigationBar(
      // onDestinationSelected: (int index) {
      //   setState(() {
      //     currentPageIndex = index;
      //   });
      // },
      // selectedIndex: currentPageIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}