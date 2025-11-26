import "package:flutter/material.dart";

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.index,
        onDestinationSelected: _go,
        destinations: const [
          NavigationDestination(
            icon: _AppLogoIcon(size: 22),
            selectedIcon: _AppLogoIcon(size: 24),
            label: '메인',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            label: '학습',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: '채팅',
          ),
        ],
      ),
    );
  }
}

class _AppLogoIcon extends StatelessWidget {
  final double size;
  const _AppLogoIcon({this.size = 22});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo-transparent.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
