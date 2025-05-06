import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';
import 'cart/cart_provider.dart';
import 'providers/user_profile.dart'; // Import UserProfile

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => UserProfile()), // Add UserProfile Provider
      ],
      child: const BoondayApp(),
    ),
  );
}

class BoondayApp extends StatelessWidget {
  const BoondayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boonday',
      theme: ThemeData(
        fontFamily: 'NotoSansThai',
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}