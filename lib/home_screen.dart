import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ภาพพื้นหลัง
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // เนื้อหาข้างหน้า
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Center(
                  child: Image.asset(
                    'assets/images/homescreen_logo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.softAqua,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'ลงทะเบียน',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPink,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.totalStatistics);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.softAqua,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'สถิติรวม',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}