import 'package:flutter/material.dart';

import 'app/theme.dart';
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
      theme: AppTheme.light(),
      initialRoute: '/splash',
      routes: appRoutes,
    );
  }
}
