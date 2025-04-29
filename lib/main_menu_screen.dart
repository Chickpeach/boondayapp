import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
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
            'assets/icons/back.png', // แทนที่ด้วย path ที่ถูกต้องของ back.png
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
                setState(() {
                  _selectedIndex = 0;
                });
                // TODO: ไปที่หน้าบัญชีผู้ใช้
                print('ไปที่หน้าบัญชีผู้ใช้');
              }),
              _buildMenuItem(context, 'ประวัติการทำบุญ', 1, () {
                setState(() {
                  _selectedIndex = 1;
                });
                // TODO: ไปที่หน้าประวัติการทำบุญ
                print('ไปที่หน้าประวัติการทำบุญ');
              }),
              _buildMenuItem(context, 'หน้าหลัก', 2, () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              }),
              _buildMenuItem(context, 'ตักบาตร & ทำบุญ', 3, () {
                setState(() {
                  _selectedIndex = 3;
                });
                // TODO: ไปที่หน้าตักบาตร & ทำบุญ
                print('ไปที่หน้าตักบาตร & ทำบุญ');
              }),
              _buildMenuItem(context, 'ขอพร & เสริมดวง', 4, () {
                setState(() {
                  _selectedIndex = 4;
                });
                // TODO: ไปที่หน้าขอพร & เสริมดวง
                print('ไปที่หน้าขอพร & เสริมดวง');
              }),
              _buildMenuItem(context, 'บริจาคมูลนิธิ', 5, () {
                setState(() {
                  _selectedIndex = 5;
                });
                // TODO: ไปที่หน้าบริจาคมูลนิธิ
                print('ไปที่หน้าบริจาคมูลนิธิ');
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
      onTap: onTap,
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
          backgroundColor: accentPink, // ใช้สี accentPink โดยตรง
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // ขอบโค้งมนมากขึ้น
          ),
          title: const Text(
            'ยืนยันออกจากระบบ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26, // ปรับขนาดตัวอักษร
            ),
            textAlign: TextAlign.center,
          ),
          content: const SizedBox(height: 0), // เพิ่มระยะห่างระหว่าง title กับ actions
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // จัดปุ่มให้มีระยะห่างเท่ากัน
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // ปิด Dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // สีเทาอ่อน
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0), // ขอบโค้งมน
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text('ยกเลิก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // ปิด Dialog
                    Navigator.popUntil(context, (route) => route.isFirst);
                    // TODO: ทำการออกจากระบบจริง (เช่น ล้าง Session, ไปหน้า Login)
                    print('ออกจากระบบ');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent[400], // สีเขียว
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0), // ขอบโค้งมน
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text('ยืนยัน'),
                ),
              ],
            ),
            const SizedBox(height: 15), // เพิ่มระยะห่างด้านล่างปุ่ม
          ],
          actionsAlignment: MainAxisAlignment.center, // จัด actions ให้อยู่ตรงกลาง (เผื่อมีปุ่มเดียว)
        );
      },
    );
  }
}