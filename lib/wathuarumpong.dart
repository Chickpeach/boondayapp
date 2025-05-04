import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Wathuarumpong extends StatelessWidget {
  final MakemeritItem? item; // Wathuarumpong ตอนนี้รับ item ได้

  const Wathuarumpong({Key? key, this.item}) : super(key: key);

  static const List<MakemeritItem> makemeritItems = [
    // ... รายการทำบุญคงเดิม
    MakemeritItem(
      imagePath: 'assets/images/makemeritone.jpg',
      title: 'ถวายสังฆทาน',
      description: '        ร่วมถวายของใช้จำเป็นสำหรับพระสงฆ์ เช่น ยารักษาโรค ของใช้ประจำวัน อาหารแห้ง สบู่ ยาสีฟัน ฯลฯ จัดชุดอย่างเรียบร้อย ถูกต้องตามพระธรรมวินัย...',
      price: 350,
    ),
    MakemeritItem(
      imagePath: 'assets/images/makemerittwo.jpg',
      title: 'ทำบุญโลงศพ',
      description: '        สมทบทุนจัดซื้อโลงศพให้ศพไร้ญาติหรือผู้ยากไร้ ผ่านมูลนิธิหรือหน่วยงานที่เกี่ยวข้อง\nผลบุญที่ได้รับ:\n• ได้บุญใหญ่มากจากการช่วยเหลือผู้สิ้นชีวิต\n• ส่งดวงวิญญาณไปสู่สุคติ\n• หนุนชีวิตให้พบสิ่งดีงาม',
      price: 599,
    ),
    MakemeritItem(
      imagePath: 'assets/images/makemeritthree.jpg',
      title: 'สะเดาะเคราะห์',
      description: '        พิธีสะเดาะเคราะห์ด้วยการถวายสังฆทาน จุดเทียนมนต์ หรือถวายของแก้เคล็ดตามความเชื่อ\nผลบุญที่ได้รับ:\n• ช่วยแก้ปีชง ดวงตก หรือเคราะห์ร้าย\n• เสริมดวงชะตาให้มั่นคง\n• ปัดเป่าสิ่งไม่ดี ให้ชีวิตราบรื่น',
      price: 299,
    ),
    MakemeritItem(
      imagePath: 'assets/images/makemeritfour.jpg',
      title: 'ถวายภัตตาหาร',
      description: '        ร่วมถวายอาหารเพลแด่พระภิกษุสงฆ์ เพื่อสืบทอดพระพุทธศาสนาและบำรุงพระภิกษุผู้ปฏิบัติดี\nผลบุญที่ได้รับ:\n• เสริมสุขภาพดี เจริญอาหาร\n• สร้างบุญที่มั่นคงและอิ่มใจ\n• หนุนชีวิตให้เจริญรุ่งเรือง',
      price: 259,
    ),
    MakemeritItem(
      imagePath: 'assets/images/makemeritfive.jpg',
      title: 'ตักบาตรวันเกิด',
      description: '        ตักบาตรพระสงฆ์ในวันเกิด เพื่อเริ่มต้นปีใหม่ในชีวิตด้วยบุญ\nผลบุญที่ได้รับ:\n• เสริมสิริมงคล โชคลาภ และความสุข\n• สร้างพลังใจให้เริ่มต้นสิ่งใหม่\n• เสริมสุขภาพ ความรุ่งเรืองในรอบปี',
      price: 299,
    ),
    MakemeritItem(
      imagePath: 'assets/images/makemeritsix.jpg',
      title: 'ถวายผ้าไตร',
      description: '        ถวายผ้าไตรครบชุด ได้แก่ จีวร สบง อังสะ เหมาะสำหรับพิธีอุปสมบทหรือถวายสังฆทานในโอกาสสำคัญ\nผลบุญที่ได้รับ:\n• ได้บุญใหญ่ หนุนบารมี\n• เสริมให้ชีวิตก้าวหน้า\n• ส่งผลให้กิจการงานรุ่งเรือง',
      price: 750,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // เพิ่ม backgroundColor ที่นี่
      body: Stack( // ใช้ Stack ครอบคลุมทั้ง Web และ Non-Web
        children: [
          // ถ้าไม่ต้องการพื้นหลังที่เป็นรูปภาพอีกต่อไป ให้คอมเมนต์ส่วนนี้หรือลบทิ้งได้เลยค่ะ
          /*Positioned.fill( // ให้ Image.asset ขยายเต็มพื้นที่ Stack
            child: Image.asset(
              'assets/images/Bg.jpg',
              fit: BoxFit.cover,
            ),
          ),*/
          const MakemeritContent(), // เนื้อหาจะอยู่เหนือพื้นหลัง
        ],
      ),
    );
  }
}
class MakemeritContent extends StatelessWidget {
  const MakemeritContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar ที่ย้ายมาไว้ด้านบน
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
                    onPressed: () {
                      // TODO: ไปหน้าตะกร้า
                    },
                  ),
                ],
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  'วัดหัวลำโพง',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                    fontFamily: 'NotoSansThai',
                  ),
                ),
              ),
            ),
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
                  itemCount: Wathuarumpong.makemeritItems.length,
                  itemBuilder: (context, index) {
                    final item = Wathuarumpong.makemeritItems[index];
                    return MakemeritItemCard(item: item);
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

class MakemeritItem {
  final String imagePath;
  final String title;
  final String description;
  final int price;

  const MakemeritItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });
}

class MakemeritItemCard extends StatelessWidget {
  final MakemeritItem item;

  const MakemeritItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDetailScreen(item: item)),
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
                        color: const Color(0xFF19C3A3),
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

// Widget สำหรับแสดงรายละเอียดไอเทม (ปรับปรุงให้สั้นลงและยกขึ้นจากด้านล่าง)
class ItemDetailScreen extends StatelessWidget {
  final MakemeritItem item;

  const ItemDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( // เพิ่ม IconButton สำหรับไอคอนย้อนกลับทางซ้าย
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // สั่งให้ย้อนกลับไปหน้าก่อนหน้า
          },
        ),
        actions: [ // เพิ่ม actions สำหรับไอคอนตะกร้าสินค้าทางขวา
          IconButton(
            onPressed: () {
              // TODO: ไปหน้าตะกร้าสินค้า
              print('ไปหน้าตะกร้าสินค้า');
            },
          ),
        ],
      ),
      backgroundColor: Colors.white, // เพิ่ม backgroundColor ที่นี่
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      item.imagePath,
                      width: 320.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item.price} บาท',
                  style: TextStyle(fontSize: 18, color: const Color(0xFF19C3A3), fontFamily: 'NotoSansThai', fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Text(
                  'รายละเอียด',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'NotoSansThai',
                      color: Color(0xFF19C3A3),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF68CBA),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: SizedBox(
                  width: 300.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                // TODO: เพิ่มจำนวน
                              },
                              color: Colors.black87,
                              iconSize: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('1', style: TextStyle(fontSize: 18, fontFamily: 'NotoSansThai')),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                // TODO: ลดจำนวน
                              },
                              color: Colors.black87,
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: เพิ่มลงตะกร้า
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF19C3A3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: const Text(
                          'ADD TO CART',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}