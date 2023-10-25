import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatefulWidget {
  final StatefulNavigationShell child;

  const RootPage({
    super.key,
    required this.child,
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      bottomNavigationBar: getBottomNavigationBar(),
      body: SafeArea(child: widget.child),
    );
  }

  NavigationBar getBottomNavigationBar() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        widget.child.goBranch(
          index,
          initialLocation: index == widget.child.currentIndex,
        );
        setState(() {});
      },
      selectedIndex: widget.child.currentIndex,
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
