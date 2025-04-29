import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'blessing_select_page.dart';

class BlessingDetailPage extends StatelessWidget {
  final BlessingItem item;

  const BlessingDetailPage({Key? key, required this.item}) : super(key: key);

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
          _BlessingDetailContent(item: item),
        ],
      )
          : Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: _BlessingDetailContent(item: item),
      ),
    );
  }
}

class _BlessingDetailContent extends StatelessWidget {
  final BlessingItem item;

  const _BlessingDetailContent({Key? key, required this.item}) : super(key: key);

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
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // TODO: ไปหน้าตะกร้า
                    },
                  ),
                ],
              ),
            ),
            // Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  item.imagePath,
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 34, // ใหญ่ขึ้น
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: 'NotoSansThai',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8), // เพิ่มระยะห่าง
            // Price
            Text(
              '${item.price} บาท',
              style: const TextStyle(
                fontSize: 26, // ใหญ่ขึ้น
                color: Colors.redAccent,
                fontFamily: 'NotoSansThai',
                fontWeight: FontWeight.w600, // หนาขึ้น
              ),
            ),
            const SizedBox(height: 16), // เพิ่มระยะห่าง
            // Description
            Padding(
              padding: const EdgeInsets.all(20.0), // Padding กว้างขึ้น
              child: Text(
                item.description,
                style: const TextStyle(
                  fontSize: 20, // ใหญ่ขึ้น
                  fontFamily: 'NotoSansThai',
                  fontWeight: FontWeight.normal,
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