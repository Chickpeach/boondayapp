import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // <– เพิ่มบรรทัดนี้
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';
import 'cart/cart_provider.dart';
import 'providers/user_profile.dart'; // Import UserProfile

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => UserProfile()),
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
      // 👇 เพิ่มส่วนนี้เพื่อให้รองรับ DatePicker ภาษาไทย
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('th', 'TH'),
        Locale('en', 'US'),
      ],
      locale: const Locale('th', 'TH'),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
