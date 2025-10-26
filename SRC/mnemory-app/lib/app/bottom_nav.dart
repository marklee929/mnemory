import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  final int index;
  final Widget child;

  const AppShell({super.key, required this.index, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  void _go(int i) {
    switch (i) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/topics');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.index,
        onDestinationSelected: _go,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: _LogoNavIcon(selected: false),
            selectedIcon: _LogoNavIcon(selected: true),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _LogoNavIcon extends StatelessWidget {
  final bool selected;
  const _LogoNavIcon({required this.selected});

  @override
  Widget build(BuildContext context) {
    final double size = selected ? 30 : 26;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Image.asset(
        'assets/logo-transparent.png',
        height: size,
        width: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
