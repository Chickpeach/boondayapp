import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'blessing_detail_page.dart';

class BlessingSelectPage extends StatelessWidget {
  const BlessingSelectPage({Key? key}) : super(key: key);

  static const List<BlessingItem> blessingItems = [
    BlessingItem(
      imagePath: 'assets/images/blessing_lakshmi.png',
      title: 'ขอพรพระแม่ลักษมี',
      description: 'เทพแห่งความมั่งคั่ง เสริมโชคลาภทางการเงิน เหมาะสำหรับคนทำธุรกิจ หรือต้องการความมั่นคงทางการเงิน',
      price: 359,
    ),
    BlessingItem(
      imagePath: 'assets/images/blessing_luangpor_tanjai.png',
      title: 'ขอพรหลวงพ่อทันใจ',
      description: 'ขึ้นชื่อเรื่อง "ขอแล้วได้" ไวมากเรื่องการงาน ความรัก และสุขภาพ เหมาะกับสายเร่งด่วน',
      price: 399,
    ),
    BlessingItem(
      imagePath: 'assets/images/blessing_ganesha.png',
      title: 'ขอพรพระพิฆเนศ',
      description: 'เทพแห่งปัญญาและความสำเร็จ เหมาะกับผู้เรียน-คนทำงานสายสร้างสรรค์ หรือนักธุรกิจที่ต้องการแรงบันดาลใจ',
      price: 349,
    ),
    BlessingItem(
      imagePath: 'assets/images/blessing_taowessuwan.png',
      title: 'ขอพรท้าวเวสสุวรรณ',
      description: 'เทพคุ้มครองป้องกันภัย ปรับดวง ปัดเคราะห์ เสริมความมั่นใจในช่วงชีวิตที่เปราะบาง',
      price: 289,
    ),
    BlessingItem(
      imagePath: 'assets/images/blessing_brahma.png',
      title: 'ขอพรพระพรหม',
      description: 'เทพเจ้าผู้ประทานพรเรื่องความรักและความสมดุลในชีวิต เหมาะกับคนที่กำลังเริ่มต้นใหม่',
      price: 379,
    ),
    BlessingItem(
      imagePath: 'assets/images/blessing_ikay_watjedee.png',
      title: 'ขอพรไอ้ไข่วัดเจดีย์',
      description: 'ขอได้ ไหว้รับ! เน้นโชคลาภ-การเงิน-เสี่ยงดวง ปังไม่หยุด โดยเฉพาะสายค้าขายห้ามพลาด',
      price: 269,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // กำหนดสีพื้นหลังเป็นสีขาว
      body: BlessingContent(),
    );
  }
}

class BlessingContent extends StatelessWidget {
  const BlessingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                    icon: Image.asset('assets/icons/cart.png', width: 28, height: 28), // ใช้รูป cart.png
                    onPressed: () {
                      // TODO: ไปหน้าตะกร้า
                    },
                  ),
                ],
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'พรนี้เพื่อคุณ!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                  fontFamily: 'NotoSansThai',
                ),
              ),
            ),
            // Grid
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;
                if (constraints.maxWidth >= 600) {
                  crossAxisCount = 3;
                }
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemCount: BlessingSelectPage.blessingItems.length,
                  itemBuilder: (context, index) {
                    final item = BlessingSelectPage.blessingItems[index];
                    return BlessingItemCard(item: item);
                  },
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class BlessingItem {
  final String imagePath;
  final String title;
  final String description;
  final int price;

  const BlessingItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });
}

class BlessingItemCard extends StatelessWidget {
  final BlessingItem item;

  const BlessingItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlessingDetailPage(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.9),
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
                  item.imagePath,
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
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontFamily: 'NotoSansThai',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${item.price} บาท',
                      style: TextStyle(
                        fontSize: 16,
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