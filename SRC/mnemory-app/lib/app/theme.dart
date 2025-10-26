import 'package:flutter/material.dart';

class AppTheme {
  static const _primary = Color(0xFF5C47C3);
  static const _secondary = Color(0xFF3DC2C0);
  static const _fg = Color(0xFF0D1B2A);
  static const _muted = Color(0xFF8AA0B2);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: _primary,
      primary: _primary,
      secondary: _secondary,
      surface: Colors.white,
      onSurface: _fg,
    );

    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF7F5FA),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: _fg,
        elevation: 0.5,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(fontSize: 14, color: _fg),
        bodySmall: TextStyle(fontSize: 12, color: _muted),
      ),
      useMaterial3: true,
    );
  }
}
