import 'package:flutter/material.dart';

import 'screens/chat.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/splash.dart';
import 'screens/topics_level1.dart';
import 'screens/topics_level2.dart';
import 'screens/topics_level3.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/splash': (_) => const SplashScreen(),
  '/home': (_) => const HomeScreen(),
  '/chat': (_) => const ChatScreen(),
  '/topics/1': (_) => const TopicsLevel1Screen(),
  '/topics/2': (_) => const TopicsLevel2Screen(),
  '/topics/3': (_) => const TopicsLevel3Screen(),
  '/profile': (_) => const ProfileScreen(),
};
