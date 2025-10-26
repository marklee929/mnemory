import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _preload() async {
    final text = await rootBundle.loadString('assets/mock/cards_today.json');
    jsonDecode(text);
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      final minDelay = Future.delayed(const Duration(seconds: 5));
      try {
        await _preload();
      } catch (e) {
        debugPrint('preload error: $e');
      }
      await minDelay;
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0D0F14),
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
