import 'package:flutter/material.dart';
import 'colors.dart';

class TotalStatisticsScreen extends StatelessWidget {
  const TotalStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ปุ่มย้อนกลับ
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/back.png',
                    width: 30, // ปรับขนาดให้ match กับหน้าอื่น
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),

          // เนื้อหา
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 16, right: 16), // เผื่อระยะจากปุ่ม
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
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: const [
                        StatisticImageBox(
                          imagePath: 'assets/images/statistics_donate.png',
                          labelTitle: 'สถิติยอดการทำบุญ',
                          labelValue: '962 คน',
                        ),
                        StatisticImageBox(
                          imagePath: 'assets/images/statistics_temple.png',
                          labelTitle: 'สถิติจำนวนวัด',
                          labelValue: '3 วัด',
                        ),
                        StatisticImageBox(
                          imagePath: 'assets/images/statistics_user.png',
                          labelTitle: 'สถิติผู้ใช้งานทั้งหมด',
                          labelValue: '2,440 คน',
                        ),
                        StatisticImageBox(
                          imagePath: 'assets/images/statistics_god.png',
                          labelTitle: 'สถิติจำนวนองค์เทพ',
                          labelValue: '6 องค์',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
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
    );
  }
}
