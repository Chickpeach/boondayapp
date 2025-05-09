import 'package:flutter/material.dart';
import 'package:boonday/routes/app_routes.dart';


class ThankYouDonate extends StatelessWidget {
  final String title;
  final String subTitle;
  final String bodyText;

  const ThankYouDonate({
    super.key,
    required this.title,
    required this.subTitle,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/menu.png', width: 35, height: 35),
                    Image.asset('assets/images/time.png', width: 35, height: 35),
                  ],
                ),
                const SizedBox(height: 100),

                // หัวเรื่องมูลนิธิ
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E8B58),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // หัวข้อขอบคุณย่อย
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),

                // เนื้อหาขอบคุณ
                Text(
                  bodyText,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    // นำทางไปยังหน้าหลัก (MainScreen) และลบ routes อื่นๆ ใน stack
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.mainScreen, // <--- ใช้ AppRoutes.mainScreen
                          (route) => false,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF19C3A3),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    child: Text(
                      "เสร็จสิ้น",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
