import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future(_bootstrap);
  }

  Future<void> _bootstrap() async {
    await Future.delayed(const Duration(milliseconds: 600));
    try {
      final text = await rootBundle.loadString('assets/mock/cards_today.json');
      final dynamic data = json.decode(text);
      final cardsLength = (data is Map && data['cards'] is List)
          ? (data['cards'] as List).length
          : 0;
      debugPrint('cards loaded: $cardsLength');
    } catch (error, stackTrace) {
      debugPrint('asset load error: $error');
      debugPrint(stackTrace.toString());
    } finally {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text('Mnemory Splash'),
          ],
        ),
      ),
    );
  }
}
