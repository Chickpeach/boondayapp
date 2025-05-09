import 'package:flutter/material.dart';
import 'package:boonday/total_statistics_screen.dart';
import 'package:boonday/home_screen.dart';
import 'package:boonday/splash_screen.dart';
import 'package:boonday/login_screen.dart';
import 'package:boonday/register_screen.dart';
import 'package:boonday/register_screen2.dart';
import 'package:boonday/register_screen3.dart';
import 'package:boonday/history.dart';
import 'package:boonday/blessing_main_page.dart';
import 'package:boonday/blessing_select_page.dart';
import 'package:boonday/blessing_detail_page.dart';
import 'package:boonday/main_screen.dart';
import 'package:boonday/cart/cart_screen.dart'; // Import CartScreen
import 'package:boonday/profile_screen.dart'; // Import ProfileScreen
import 'package:boonday/edit_profile_screen.dart'; // Import EditProfileScreen



class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String register2 = '/register2';
  static const String register3 = '/register3';
  static const String totalStatistics = '/total-statistics';
  static const String history = '/history';
  static const String blessingMain = '/blessing-main';
  static const String blessingSelect = '/blessing-select';
  static const String blessingDetail = '/blessing-detail';
  static const String mainScreen = '/main-screen';
  static const String cart = '/cart'; // Add cart route
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    totalStatistics: (context) => const TotalStatisticsScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    register2: (context) => const Register2Screen(),
    register3: (context) => const Register3Screen(),
    mainScreen: (context) => const MainScreen(),
    history: (context) => const HistoryScreen(),
    blessingMain: (context) => const BlessingMainPage(),
    blessingSelect: (context) => const BlessingSelectPage(),
    blessingDetail: (context) => BlessingDetailPage(
      item: BlessingItem(
        imagePath: 'assets/images/blessing_lakshmi.png',
        title: 'ขอพรพระแม่ลักษมี',
        description: 'เทพแห่งความมั่งคั่ง เสริมโชคลาภทางการเงิน เหมาะสำหรับคนทำธุรกิจ หรือต้องการความมั่นคงทางการเงิน',
        price: 359,
      ),
    ),
    cart: (context) => const CartScreen(), // Map cart route to CartScreen
    profile: (context) => const ProfileScreen(), // Map /profile to ProfileScreen
    editProfile: (context) => const EditProfileScreen(), // Map /edit-profile to EditProfileScreen
  };
}