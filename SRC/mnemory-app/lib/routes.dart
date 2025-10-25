import 'package:flutter/material.dart';

import 'screens/chat.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/splash.dart';
import 'screens/topics_level1.dart';
import 'screens/topics_level2.dart';
import 'screens/topics_level3.dart';

class AppRoutes {
  static const splash = '/splash';
  static const home = '/home';
  static const chat = '/chat';
  static const topicsLevel1 = '/topics/level1';
  static const topicsLevel2 = '/topics/level2';
  static const topicsLevel3 = '/topics/level3';
  static const profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        home: (_) => const HomeScreen(),
        chat: (_) => const ChatScreen(),
        topicsLevel1: (_) => const TopicsLevel1Screen(),
        topicsLevel2: (_) => const TopicsLevel2Screen(),
        topicsLevel3: (_) => const TopicsLevel3Screen(),
        profile: (_) => const ProfileScreen(),
      };
}
