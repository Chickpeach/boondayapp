import 'package:flutter/material.dart';
import 'package:boonday/routes/app_routes.dart'; // Import your AppRoutes
import 'blessing_main_page.dart'; // Import the BlessingMainPage (อาจจะไม่ได้ใช้แล้ว)
import 'make_merit_main.dart'; // Import MakeMeritMainPage
import 'mainfoundation.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _selectedIndex = -1;
  static const accentPink = Color(0xFFF68CBA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18C3A3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'เมนู',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildMenuItem(context, 'บัญชีผู้ใช้', 0, () {
                Navigator.pushNamed(context, AppRoutes.profile);
              }),
              _buildMenuItem(context, 'ประวัติการทำบุญ', 1, () {
                Navigator.pushNamed(context, AppRoutes.history); // Navigate to history
              }),
              _buildMenuItem(context, 'หน้าหลัก', 2, () {
                Navigator.pop(context);
              }),
              _buildMenuItem(context, 'ตักบาตร & ทำบุญ', 3, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BlessingMainPage()), // ยังคงเชื่อมไป BlessingMainPage ตามเดิม
                );
              }),
              _buildMenuItem(context, 'ขอพร & เสริมดวง', 4, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MakeMeritMainPage()),
                );
              }),
              _buildMenuItem(context, 'บริจาคมูลนิธิ', 5, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainFoundation()),
                );
              }),
              _buildMenuItem(context, 'ออกจากระบบ', 6, () {
                _showLogoutConfirmationDialog(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  /// ฟังก์ชันสร้างรายการเมนู
  Widget _buildMenuItem(BuildContext context, String title, int index, VoidCallback onTap) {
    final bool isSelected = index == _selectedIndex;
    final TextStyle textStyle = TextStyle(
      fontSize: 25,
      color: isSelected ? accentPink : Colors.white,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        onTap(); // เรียก onTap ที่ส่งมา
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              title,
              style: textStyle,
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 80,
              color: accentPink,
            ),
        ],
      ),
    );
  }

  /// ฟังก์ชันแสดง Dialog ยืนยันการออกจากระบบ
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: accentPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text(
            'ยืนยันออกจากระบบ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          ),
          content: const SizedBox(height: 0),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text('ยกเลิก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    Navigator.popUntil(context, (route) => route.isFirst);
                    print('ออกจากระบบ');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent[400],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text('ยืนยัน'),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}