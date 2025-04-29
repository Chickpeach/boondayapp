import 'package:flutter/material.dart';
import 'package:boonday/main_menu_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // นำทางไปยังหน้าตะกร้าสินค้า
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2E8B58)),
              child: Text(
                'เมนู',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('โปรไฟล์'),
              onTap: () {
                // ไปหน้าโปรไฟล์
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('ตั้งค่า'),
              onTap: () {
                // ไปหน้าตั้งค่า
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('ออกจากระบบ'),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 80), // โลโก้แอป
                const SizedBox(height: 16),
                const Text(
                  'BOONDAY',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // รายการเมนูหลัก
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem('ทำบุญ', 'assets/images/blessingbtn.png'),
                _buildMenuItem('ขอพร', 'assets/images/wishingbtn.png'),
                _buildMenuItem('บริจาค', 'assets/images/donatebtn.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ฟังก์ชันสร้างเมนูแต่ละรายการ
  Widget _buildMenuItem(String title, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          // ใส่ฟังก์ชันนำทางหรือกระทำเมื่อแตะที่เมนู
        },
      ),
    );
  }
}