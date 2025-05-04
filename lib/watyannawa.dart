import 'package:flutter/material.dart';

// คลาสหลักสำหรับหน้า Wat Yannawa
class WatYannawa extends StatelessWidget {
  final MakemeritItem? item;

  const WatYannawa({Key? key, this.item}) : super(key: key);

  static const List<MakemeritItem> makemeritItems = [
    MakemeritItem(
      imagePath: 'assets/images/yannawaone.jpg',
      title: 'สังฆทานรักษาโรค',
      description: '        จัดเตรียมสังฆทานที่เน้นอุปกรณ์และเวชภัณฑ์สำหรับพระสงฆ์อาพาธ เช่น ยาแก้ไข ผ้าพันแผล แอลกอฮอล์ หน้ากากอนามัย และของใช้จำเป็นอื่น ๆ เพื่อส่งมอบผ่านวัดหรือหน่วยช่วยเหลือภายในวัด\nผลบุญที่ได้รับ:\n• ส่งเสริมสุขภาพของพระภิกษุผู้ปฏิบัติธรรม\n• หนุนนำให้พ้นจากโรคภัยไข้เจ็บ\n• เสริมบารมีในการช่วยเหลือเพื่อนมนุษย์',
      price: 450,
    ),
    MakemeritItem(
      imagePath: 'assets/images/yannawatwo.jpg',
      title: 'ถวายผ้าไตรจีวร',
      description: '        ถวายผ้าไตรครบชุด (จีวร สบง อังสะ) สำหรับพระภิกษุในช่วงเข้าพรรษา เป็นการสนับสนุนการบำเพ็ญเพียรในช่วงที่พระอยู่ประจำวัด\nผลบุญที่ได้รับ:\n• ได้อานิสงส์สูงในการส่งเสริมศาสนา\n• เสริมความมั่นคงในชีวิตและการงาน\n• ได้บุญจากการอุปถัมภ์ผู้ปฏิบัติธรรมอย่างแท้จริง',
      price: 850,
    ),
    MakemeritItem(
      imagePath: 'assets/images/yannawathree.jpg',
      title: 'บูรณะพระอุโบสถ',
      description: '        ร่วมสมทบทุนในการบูรณะพระอุโบสถหรืออาคารสำคัญทางพุทธศาสนา เพื่อความสวยงามและคงไว้ซึ่งแหล่งเรียนรู้ธรรมะ\nผลบุญที่ได้รับ:\n• เป็นการทำนุบำรุงพระศาสนาให้ยั่งยืน\n• เสริมฐานบุญให้มั่นคงในภพชาติหน้า\n• ส่งผลให้พบความร่มเย็นในชีวิต',
      price: 999,
    ),
    MakemeritItem(
      imagePath: 'assets/images/yannawafour.jpg',
      title: 'เจ้าภาพสวดอภิธรรม',
      description: '        ร่วมเป็นเจ้าภาพในงานสวดพระอภิธรรม อุทิศส่วนกุศลให้แก่ผู้วายชนม์ เพื่อส่งดวงวิญญาณไปสู่สุขคติ\nผลบุญที่ได้รับ:\n• ได้บุญจากการแสดงความกตัญญูต่อผู้ล่วงลับ\n• เสริมพลังเมตตาและการให้อภัย\n• เกิดความสงบสุขในจิตใจ',
      price: 299,
    ),
    MakemeritItem(
      imagePath: 'assets/images/yannayafive.jpg',
      title: 'จุดประทีปบูชาพระ',
      description: '        จุดประทีปหรือเทียนบูชาพระประธานในวิหาร เป็นการแสดงความศรัทธา และอธิษฐานจิตให้เกิดแสงสว่างในชีวิต\nผลบุญที่ได้รับ:\n• แก้ไขความมืดมนในชีวิต\n• ส่งเสริมปัญญาให้สว่างไสว\n• เสริมมงคลแก่ชีวิตทั้งทางโลกและธรรม',
      price: 159,
    ),
    MakemeritItem(
      imagePath: 'assets/images/yannayasix.jpg',
      title: 'ถวายเครื่องไทยธรรม',
      description: '        ถวายของจำเป็นแก่พระธรรมทูตที่ออกเผยแผ่ธรรมะตามต่างจังหวัดหรือชนบทห่างไกล\nผลบุญที่ได้รับ:\n• ได้ร่วมเผยแผ่พระธรรมคำสอน\n• เสริมความมั่นคงในศรัทธา\n• ได้บุญอานิสงส์ในการสืบทอดพุทธศาสนา',
      price: 399,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // เพิ่ม backgroundColor ที่นี่
      body: Stack(
        children: [
          // ถ้าไม่ต้องการพื้นหลังที่เป็นรูปภาพอีกต่อไป ให้คอมเมนต์ส่วนนี้หรือลบทิ้งได้เลยค่ะ
          /*Positioned.fill(
            child: Image.asset(
              'assets/images/Bg.jpg',
              fit: BoxFit.cover,
            ),
          ),*/
          const MakemeritContent(),
        ],
      ),
    );
  }
}

// แสดงเนื้อหา
class MakemeritContent extends StatelessWidget {
  const MakemeritContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      // ไปหน้าตะกร้า
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  'วัดยานนาวา',
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
                int crossAxisCount = constraints.maxWidth >= 600 ? 3 : 2;
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
                  itemCount: WatYannawa.makemeritItems.length,
                  itemBuilder: (context, index) {
                    final item = WatYannawa.makemeritItems[index];
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

// ข้อมูล item
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

// Card สำหรับแสดงไอเทม
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
                      maxLines: 2, // จำกัดให้แสดง 2 บรรทัด
                      overflow: TextOverflow.ellipsis, // ถ้าเกินให้แสดง ...
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${item.price} บาท',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF19C3A3),
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

// หน้ารายละเอียดไอเทม
class ItemDetailScreen extends StatelessWidget {
  final MakemeritItem item;

  const ItemDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/cart.png', width: 28, height: 28), // ใช้รูป cart.png
            onPressed: () {},
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
                  style: const TextStyle(fontSize: 18, color: Color(0xFF19C3A3), fontFamily: 'NotoSansThai', fontWeight: FontWeight.w600),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
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
                              onPressed: () {},
                              color: Colors.black87,
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
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