import 'package:flutter/material.dart';
import 'package:boonday/total_statistics_screen.dart';
import 'package:boonday/home_screen.dart';
import 'package:boonday/splash_screen.dart';



class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const totalStatistics = '/total-statistics';


  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    totalStatistics: (context) => const TotalStatisticsScreen(),
  };
}
