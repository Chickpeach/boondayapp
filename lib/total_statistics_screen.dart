import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // ใช้เพื่อตรวจสอบแพลตฟอร์ม
import 'colors.dart';

class TotalStatisticsScreen extends StatelessWidget {
  const TotalStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png',
            width: 40,
            height: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'สถิติรวม',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.softAqua,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
                  children: const [
                    StatisticImageBox(
                      imagePath: 'assets/images/statistics_donate.png',
                      labelTitle: 'สถิติยอดการทำบุญ',
                      labelValue: '962 คน',
                    ),
                    SizedBox(width: 16),
                    StatisticImageBox(
                      imagePath: 'assets/images/statistics_temple.png',
                      labelTitle: 'สถิติจำนวนวัด',
                      labelValue: '3 วัด',
                    ),
                    SizedBox(width: 16),
                    StatisticImageBox(
                      imagePath: 'assets/images/statistics_user.png',
                      labelTitle: 'สถิติผู้ใช้งานทั้งหมด',
                      labelValue: '2,440 คน',
                    ),
                    SizedBox(width: 16),
                    StatisticImageBox(
                      imagePath: 'assets/images/statistics_god.png',
                      labelTitle: 'สถิติจำนวนองค์เทพ',
                      labelValue: '6 องค์',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticImageBox extends StatelessWidget {
  final String imagePath;
  final String labelTitle;
  final String labelValue;

  const StatisticImageBox({
    super.key,
    required this.imagePath,
    required this.labelTitle,
    required this.labelValue,
  });

  @override
  Widget build(BuildContext context) {
    double imageSize = getImageSize(context);

    return SizedBox(
      width: imageSize, // ปรับขนาดให้พอดี
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // ป้องกันการขยายภาพเกินไป
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Column(
              children: [
                Text(
                  labelTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  labelValue,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.softRed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// กำหนดขนาดภาพให้พอดีตามแพลตฟอร์ม
  double getImageSize(BuildContext context) {
    if (kIsWeb) {
      return 180; // ปรับขนาดภาพให้พอดีบนเว็บ
    } else {
      return MediaQuery.of(context).size.width > 600 ? 200 : 180; // มือถือยังคงขนาดเดิม
    }
  }
}