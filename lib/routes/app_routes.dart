import 'package:flutter/material.dart';
import 'package:boonday/total_statistics_screen.dart';
import 'package:boonday/home_screen.dart';
import 'package:boonday/splash_screen.dart';
import 'package:boonday/login_screen.dart';
import 'package:boonday/register_screen.dart';
import 'package:boonday/register_screen2.dart';
import 'package:boonday/register_screen3.dart';
import 'package:boonday/main_screen.dart'; // ✅ เพิ่มตรงนี้

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String register2 = '/register2';
  static const String register3 = '/register3';
  static const String totalStatistics = '/total-statistics';
  static const String main = '/main'; //

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    totalStatistics: (context) => const TotalStatisticsScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    register2: (context) => const Register2Screen(),
    register3: (context) => const Register3Screen(),
    main: (context) => const MainScreen(), //
  };
}
