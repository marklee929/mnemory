import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await Future.delayed(const Duration(seconds: 5));
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Hero(
          tag: 'app_logo',
          child: Image(
            image: AssetImage('assets/logo-transparent.png'),
            width: 140,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
