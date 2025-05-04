import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'main_menu_screen.dart';
import 'blessing_main_page.dart' as blessing;
import 'make_merit_main.dart' as merit;
import 'package:boonday/routes/app_routes.dart'; // Import AppRoutes

class WishingScreen extends StatelessWidget {
  const WishingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ขอพร & เสริมดวง'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/cart.png',
              width: 30,
              height: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: const Center(child: Text('หน้าจอสำหรับ ขอพร & เสริมดวง')),
    );
  }
}

class DonateFoundationScreen extends StatelessWidget {
  const DonateFoundationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บริจาคมูลนิธิ'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/cart.png',
              width: 30,
              height: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: const Center(child: Text('หน้าจอสำหรับ บริจาคมูลนิธิ')),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget _buildMenuImage(BuildContext context, String imagePath, String title) {
    double imageWidth = double.infinity;
    double imageHeight = 150;

    if (kIsWeb) {
      imageWidth = 400;
      imageHeight = 120;
    }

    return InkWell(
      onTap: () {
        print('แตะที่เมนู: $title');
        if (title == 'ตักบาตร & ทำบุญ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => blessing.BlessingMainPage()),
          );
        } else if (title == 'ขอพร & เสริมดวง') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => merit.MakeMeritMainPage()),
          );
        } else if (title == 'บริจาคมูลนิธิ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DonateFoundationScreen()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/bars.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainMenuScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/cart.png',
              width: 30,
              height: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: kIsWeb ? 600 : double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: kIsWeb ? 80 : 100,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'BOONDAY',
                        style: TextStyle(
                          fontSize: kIsWeb ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E8B58),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 64.0 : 32.0),
                        child: Image.asset(
                          'assets/images/intro.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildMenuImage(context, 'assets/images/blessingbtn.png', 'ตักบาตร & ทำบุญ'),
                  const SizedBox(height: 16),
                  _buildMenuImage(context, 'assets/images/wishingbtn.png', 'ขอพร & เสริมดวง'),
                  const SizedBox(height: 16),
                  _buildMenuImage(context, 'assets/images/donatebtn.png', 'บริจาคมูลนิธิ'),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}