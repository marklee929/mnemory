import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MnemoryApp());
}

class MnemoryApp extends StatelessWidget {
  const MnemoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mnemory Sandbox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5C47C3)),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: appRoutes,
    );
  }
}
