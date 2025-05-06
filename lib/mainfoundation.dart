import 'package:flutter/material.dart';
import 'detail00.dart';
import 'detail01.dart';
import 'detail02.dart';
import 'detail03.dart';
import 'detail04.dart';
import 'detail05.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Foundation',
      theme: ThemeData(
        fontFamily: 'NotoSansThai',
        primarySwatch: Colors.blue,
      ),
      home: const MainFoundation(),
    );
  }
}

class MainFoundation extends StatefulWidget {
  const MainFoundation({super.key});

  @override
  State<MainFoundation> createState() => _MainFoundationState();
}

class _MainFoundationState extends State<MainFoundation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/menu.png', fit: BoxFit.cover),
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/time.png', fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "มูลนิธิ",
                  style: TextStyle(
                    color: Color(0xFF2E8B58),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansThai',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 26),
              Container(
                color: const Color(0xFFD3FDD3),
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.only(bottom: 28),
                width: double.infinity,
                child: const Center(
                  child: SizedBox(
                    width: 268,
                    child: Text(
                      "ขอขอบคุณทุกการบริจาคอันมีค่า",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoSansThai',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              buildFoundationRow(
                'assets/images/foundation1.png',
                'ศิริราชมูลนิธิ',
                'assets/images/foundation2.png',
                'มูลนิธิศูนย์พิทักษ์เด็ก',
                onLeftTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailFoundation00()),
                ),
                onRightTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailFoundation01()),
                ),
              ),
              buildFoundationRow(
                'assets/images/foundation3.png',
                'มูลนิธิโรงพยาบาลราชวิถี',
                'assets/images/foundation4.png',
                'มูลนิธิกระจกเงา',
                onLeftTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailFoundation02()),
                ),
                onRightTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailFoundation03()),
                ),
              ),
              buildFoundationRow(
                'assets/images/foundation5.png',
                'มูลนิธิยุวพัฒน์',
                'assets/images/foundation6.png',
                'มูลนิธิช่วยชีวิต\nสัตว์ป่า',
                onLeftTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailFoundation04()),
                ),
                onRightTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailFoundation05()),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFoundationRow(
      String assetLeft,
      String titleLeft,
      String assetRight,
      String titleRight, {
        void Function()? onLeftTap,
        void Function()? onRightTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(child: buildFoundationItem(assetLeft, titleLeft, onLeftTap)),
          const SizedBox(width: 12),
          Expanded(child: buildFoundationItem(assetRight, titleRight, onRightTap)),
        ],
      ),
    );
  }

  Widget buildFoundationItem(String asset, String title, VoidCallback? onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300, // 👈 ปรับให้ขนาดเล็กลงเล็กน้อย
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(asset, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 140,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoSansThai',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
