import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'fortune_detail_page.dart';

class FortuneBoostPage extends StatelessWidget {
  const FortuneBoostPage({Key? key}) : super(key: key);

  static const List<Map<String, String>> items = [
    {
      'title': 'แผ่นทอง วัดแขก หมั่ง',
      'price': '199 บาท',
      'description': 'ใช้แปะเพื่อเสริมสิริมงคล เพิ่มพลังบวก สร้างพลังชีวิตใหม่ให้กับตัวคุณ',
      'imagePath': 'assets/images/golden_leaf_che_kung_temple.png',
    },
    {
      'title': 'ด้ายแดง วัดหวังต้าเซียน',
      'price': '289 บาท',
      'description': 'เครื่องรางเสริมฮวงจุ้ยจากฮ่องกง ปรับดวงและพลังรอบตัวให้สมดุล ลดพลังลบ',
      'imagePath': 'assets/images/red_thread_wongtaixian.png',
    },
    {
      'title': 'วอลเปเปอร์มงคล',
      'price': '149 บาท',
      'description': 'เลือกดาวน์โหลดได้ตามวันเกิด เสริมการเงิน ความรัก การเรียน การงาน โหลดใช้ได้ทันที!',
      'imagePath': 'assets/images/auspicious_wallpaper_luck.png',
    },
    {
      'title': 'ยันต์ท้าวเวสสุวรรณ',
      'price': '179 บาท',
      'description': 'ยันต์เล็กสำหรับพกพา แกะอักขระด้วยมือ พร้อมอธิษฐานจิต ป้องกันภัยร้าย',
      'imagePath': 'assets/images/yantra_guardian_taowessuwan.png',
    },
    {
      'title': 'เครื่องรางโอมาโมริ',
      'price': '259 บาท',
      'description': 'เครื่องรางนำเข้าจากญี่ปุ่น เสริมเสน่ห์ ช่วยเรื่องความรัก คนโสด คนมีคู่ใช้ได้หมด',
      'imagePath': 'assets/images/charm_omamori_love.png',
    },
    {
      'title': 'กำไลหินมงคล',
      'price': '499 บาท',
      'description': 'หินแท้ตามวันเกิด + พลังอธิษฐานจากพระเกจิ สวมใส่เพื่อพลังชีวิตและเสริมพลังจิตใจ',
      'imagePath': 'assets/images/luckystone.png',
    },
  ];

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
          const _FortuneContent(),
        ],
      )
          : Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const _FortuneContent(),
      ),
    );
  }
}

class _FortuneContent extends StatelessWidget {
  const _FortuneContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
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
                  icon: SizedBox(
                    width: 28,
                    height: 28,
                    child: Image.asset(
                      'assets/icons/shopping-cart.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  onPressed: () {
                    // ไปหน้าตะกร้า
                  },
                ),
              ],
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text(
              'เสริมดวงประจำตัว',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
                fontFamily: 'NotoSansThai',
              ),
            ),
          ),
          // Grid Items
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;
                if (constraints.maxWidth >= 600) {
                  crossAxisCount = 3;
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemCount: FortuneBoostPage.items.length,
                  itemBuilder: (context, index) {
                    final item = FortuneBoostPage.items[index];
                    return _FortuneItemCard(item: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FortuneItemCard extends StatelessWidget {
  final Map<String, String> item;

  const _FortuneItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FortuneDetailPage(
              title: item['title']!,
              price: item['price']!,
              description: item['description']!,
              imagePath: item['imagePath']!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.asset(
                  item['imagePath']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontFamily: 'NotoSansThai',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item['price']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'NotoSansThai',
                      ),
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
