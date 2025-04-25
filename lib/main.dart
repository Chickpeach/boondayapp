import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const BoondayApp());
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
