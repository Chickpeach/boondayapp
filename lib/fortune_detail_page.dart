import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FortuneDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String imagePath;

  const FortuneDetailPage({
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb
          ? Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          _FortuneDetailContent(
            title: title,
            price: price,
            description: description,
            imagePath: imagePath,
          ),
        ],
      )
          : Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: _FortuneDetailContent(
          title: title,
          price: price,
          description: description,
          imagePath: imagePath,
        ),
      ),
    );
  }
}

class _FortuneDetailContent extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String imagePath;

  const _FortuneDetailContent({
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header with back button and cart icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/icons/cart.png', width: 28, height: 28), // ใช้รูป cart.png
                    onPressed: () {
                      // TODO: ไปหน้าตะกร้า
                    },
                  ),
                ],
              ),
            ),
            // Image in square shape
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Product Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 34, // ใหญ่ขึ้น
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: 'NotoSansThai',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Product Price
            Text(
              price,
              style: const TextStyle(
                fontSize: 26, // ใหญ่ขึ้น
                color: Colors.redAccent,
                fontFamily: 'NotoSansThai',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            // Product Description
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 20, // ใหญ่ขึ้น
                  fontFamily: 'NotoSansThai',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
