import 'package:flutter/material.dart';
import 'package:boonday/routes/app_routes.dart'; // Import AppRoutes
import 'cart/cart_provider.dart'; // แก้ไข 'path/to/' ให้ถูกต้อง
import 'package:provider/provider.dart'; // ถ้าใช้ Provider
import 'cart/CartMakemerit_Item.dart';

// คลาสหลักสำหรับหน้า Wat Chong Lom
class WatChongLom extends StatelessWidget {
  final MakemeritItem? item;

  const WatChongLom({Key? key, this.item}) : super(key: key);

  static const List<MakemeritItem> makemeritItems = [
    MakemeritItem(
      imagePath: 'assets/images/chonglomone.jpg',
      title: 'ร่วมสร้างพระพุทธรูป',
      description: '        ร่วมสมทบทุนในการหล่อหรือจัดสร้างพระพุทธรูปองค์ใหม่เพื่อประดิษฐานในวัด เป็นพุทธานุสสติอันเป็นสิริมงคล\nผลบุญที่ได้รับ:\n• ได้อานิสงส์มหาศาลจากการสร้างพุทธานุสรณ์\n• เสริมชีวิตให้มั่นคงและเป็นที่เคารพ\n• ส่งผลให้จิตใจสงบ เย็น และสว่างไสว',
      price: 1500,
    ),
    MakemeritItem(
      imagePath: 'assets/images/chonglomtwo.jpg',
      title: 'ถวายน้ำดื่มสะอาด',
      description: '        ร่วมบริจาคน้ำดื่มสะอาดสำหรับพระภิกษุ สามเณร และญาติโยมที่มาทำบุญที่วัด เพื่อให้ทุกท่านมีน้ำดื่มสะอาดในกิจกรรมต่าง ๆ เช่น การสวดมนต์ ปฏิบัติธรรม หรือร่วมงานบุญ\nผลบุญที่ได้รับ:\n• ได้บุญแห่งการยังชีวิต\n• เสริมสุขภาพและความชุ่มเย็นทั้งกายใจ\n• หนุนชีวิตให้ไหลลื่น ไม่ติดขัดดุจสายน้ำ',
      price: 150,
    ),
    MakemeritItem(
      imagePath: 'assets/images/chonglomthree.jpg',
      title: 'ทำบุญงานบุญ',
      description: '        สนับสนุนการจัดกิจกรรมในวันวิสาขบูชา มาฆบูชา หรืออาสาฬหบูชา เช่น การเวียนเทียน ตักบาตร และปาฏิโมกข์\nผลบุญที่ได้รับ:\n• สืบสานพระพุทธศาสนาให้เข้าถึงประชาชน\n• เสริมความรักความสามัคคีในครอบครัวและชุมชน\n• ได้บุญจากความมีจิตศรัทธาและมีส่วนร่วมทางธรรม',
      price: 499,
    ),
    MakemeritItem(
      imagePath: 'assets/images/chonglomfour.jpg',
      title: 'บริจาคหนังสือธรรมะ',
      description: '        จัดพิมพ์หรือบริจาคหนังสือธรรมะแจกฟรีให้ผู้สนใจเรียนรู้เพื่อเสริมปัญญาและการเข้าใจธรรมะ\nผลบุญที่ได้รับ:\n• ได้บุญจากการเผยแพร่พระธรรม\n• ส่งเสริมการพัฒนาปัญญาแก่ผู้อื่น\n• หนุนนำให้มีสติและความเข้าใจในชีวิต',
      price: 199,
    ),
    MakemeritItem(
      imagePath: 'assets/images/chonglomfive.jpg',
      title: 'ถวายหลอดไฟ',
      description: '        บริจาคหลอดไฟ LED หรืออุปกรณ์แสงสว่างให้ทางวัด เพื่อเพิ่มความสว่างและความปลอดภัย\nผลบุญที่ได้รับ:\n• ได้บุญจากการให้แสงสว่างทางกายและทางใจ\n• เสริมความชัดเจนในหนทางชีวิต\n• ป้องกันอุปสรรคและความมืดบอดทางจิต',
      price: 99,
    ),
    MakemeritItem(
      imagePath: 'assets/images/chonglomsix.jpg',
      title: 'ถวายอาหารสัตว์',
      description: '        ร่วมบริจาคหญ้าแห้ง อาหารสัตว์ หรือเวชภัณฑ์สำหรับสัตว์ที่ทางวัดดูแล เช่น สุนัขหรือแมวจร\nผลบุญที่ได้รับ:\n• ได้บุญจากการเมตตาสัตว์\n• เสริมสร้างจิตใจให้มีความกรุณา\n• หนุนนำให้ชีวิตพบแต่คนดีและสิ่งแวดล้อมที่เมตตา',
      price: 249,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const ChongLomContent(),
        ],
      ),
    );
  }
}

// แสดงเนื้อหาสำหรับวัดช่องลม
class ChongLomContent extends StatelessWidget {
  const ChongLomContent({Key? key}) : super(key: key);

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
                    icon: Image.asset('assets/icons/cart.png', width: 35, height: 35),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.cart); // นำทางไปที่หน้า Cart
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  'วัดช่องลม',
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
                  itemCount: WatChongLom.makemeritItems.length,
                  itemBuilder: (context, index) {
                    final item = WatChongLom.makemeritItems[index];
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

// ข้อมูล item (คงเดิม)
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

// Card สำหรับแสดงไอเทม (คงเดิม)
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

// หน้ารายละเอียดไอเทม ( StatefulWidget )
class ItemDetailScreen extends StatefulWidget {
  final MakemeritItem item;

  const ItemDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

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
            icon: Image.asset('assets/icons/cart.png', width: 35, height: 35),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart); // นำทางไปที่หน้า Cart
            },
          ),
        ],
      ),
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
                      widget.item.imagePath,
                      width: 320.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.item.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.item.price} บาท',
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
                    widget.item.description,
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
                              onPressed: _incrementQuantity,
                              color: Colors.black87,
                              iconSize: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('$_quantity', style: const TextStyle(fontSize: 18, fontFamily: 'NotoSansThai')),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: _decrementQuantity,
                              color: Colors.black87,
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          final cartProvider = Provider.of<CartProvider>(context, listen: false);
                          final cartMakemeritItem = CartMakemeritItem(
                            title: widget.item.title,
                            price: widget.item.price.toDouble(),
                            description: widget.item.description,
                            imagePath: widget.item.imagePath,
                          );
                          cartProvider.addItem(
                            cartMakemeritItem,
                            widget.item.price.toDouble(),
                            _quantity, // ส่งจำนวนที่เลือก
                          );
                          print('Add $_quantity of ${widget.item.title} to cart');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('เพิ่ม ${widget.item.title} x $_quantity ลงในตะกร้าแล้ว')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF19C3A3), // กำหนดสีที่นี่
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: const Text(
                          'เพิ่มลงตะกร้า',
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