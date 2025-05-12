import 'package:flutter/material.dart';
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
padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
child: Column(
children: [
const Text(
'สถิติรวม',
style: TextStyle(
fontSize: 32,
fontWeight: FontWeight.bold,
color: AppColors.softAqua,
),
textAlign: TextAlign.center,
),
SizedBox(
height: MediaQuery.of(context).size.width < 600 ? 2 : 16,
),
Expanded(
child: Center(
child: Wrap(
spacing: 16, // ช่องว่างระหว่างกล่องแนวนอน
runSpacing: 16, // ช่องว่างระหว่างกล่องแนวตั้ง
alignment: WrapAlignment.center,
children: getStatisticBoxes(context),
),
),
),
],
),
),
);
}

List<Widget> getStatisticBoxes(BuildContext context) {
double screenWidth = MediaQuery.of(context).size.width;
double boxWidth = screenWidth > 600
? (screenWidth / 2) - 48 // จอใหญ่: 2 คอลัมน์ โดยลบระยะห่างและ padding
    : 140; // จอเล็ก: ขนาดคงที่

return [
StatisticImageBox(
imagePath: 'assets/images/statistics_donate.png',
labelTitle: 'สถิติยอดการทำบุญ',
labelValue: '962 คน',
width: boxWidth,
),
StatisticImageBox(
imagePath: 'assets/images/statistics_temple.png',
labelTitle: 'สถิติจำนวนวัด',
labelValue: '3 วัด',
width: boxWidth,
),
StatisticImageBox(
imagePath: 'assets/images/statistics_user.png',
labelTitle: 'สถิติผู้ใช้งานทั้งหมด',
labelValue: '2,440 คน',
width: boxWidth,
),
StatisticImageBox(
imagePath: 'assets/images/statistics_god.png',
labelTitle: 'สถิติจำนวนองค์เทพ',
labelValue: '6 องค์',
width: boxWidth,
),
];
}
}

class StatisticImageBox extends StatelessWidget {
final String imagePath;
final String labelTitle;
final String labelValue;
final double width;

const StatisticImageBox({
super.key,
required this.imagePath,
required this.labelTitle,
required this.labelValue,
required this.width,
});

@override
Widget build(BuildContext context) {
return SizedBox(
width: width,
child: Column(
children: [
ClipRRect(
borderRadius: BorderRadius.circular(12),
child: Container(
padding: const EdgeInsets.all(12),
child: SizedBox(
height: 100,
child: Image.asset(
imagePath,
fit: BoxFit.contain,
),
),
),
),
const SizedBox(height: 4),
Text(
labelTitle,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: Colors.black,
),
),
Text(
labelValue,
style: TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: AppColors.softRed,
),
),
],
),
);
}
}