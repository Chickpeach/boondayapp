import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'blessing_select_page.dart';

class BlessingDetailPage extends StatelessWidget {
  final BlessingItem item;

  const BlessingDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _BlessingDetailContent(item: item), // ส่ง item เข้าไป
    );
  }
}

class _BlessingDetailContent extends StatefulWidget { // เปลี่ยนเป็น StatefulWidget
  final BlessingItem item;

  const _BlessingDetailContent({Key? key, required this.item}) : super(key: key);

  @override
  State<_BlessingDetailContent> createState() => _BlessingDetailContentState(); // เปลี่ยนชื่อ State คลาสให้ถูกต้อง
}

class _BlessingDetailContentState extends State<_BlessingDetailContent> { // เปลี่ยนชื่อ State คลาสให้ถูกต้อง
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
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
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
                      widget.item.imagePath, // เปลี่ยนเป็น widget.item.imagePath
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Product Title
                Text(
                  widget.item.title, // เปลี่ยนเป็น widget.item.title
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
                  widget.item.price.toString(), // ใช้ method toString() ในการแปลงเป็น String
                  style: const TextStyle(
                    fontSize: 26,
                    color: Color(0xFF19C3A3),
                    fontFamily: 'NotoSansThai',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                // Product Description
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.item.description, // เปลี่ยนเป็น widget.item.description
                    style: const TextStyle(
                      fontSize: 20, // ใหญ่ขึ้น
                      fontFamily: 'NotoSansThai',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 120), // เพิ่ม SizedBox เพื่อให้มีพื้นที่ด้านล่างสำหรับปุ่ม
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
                          // TODO: Implement add to cart functionality with _quantity
                          print('Add $_quantity of ${widget.item.title} to cart'); // เปลี่ยนเป็น widget.item.title
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