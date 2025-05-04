import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'blessing_select_page.dart';
import 'package:boonday/routes/app_routes.dart'; // Import AppRoutes
import 'cart/cart_provider.dart'; // แก้ไข 'path/to/' ให้ถูกต้อง
import 'package:provider/provider.dart'; // ถ้าใช้ Provider
import 'cart/blessing_item.dart'; // Import CartBlessingItem

class BlessingDetailPage extends StatelessWidget {
  final BlessingItem item;

  const BlessingDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _BlessingDetailContent(item: item),
    );
  }
}

class _BlessingDetailContent extends StatefulWidget {
  final BlessingItem item;

  const _BlessingDetailContent({Key? key, required this.item}) : super(key: key);

  @override
  State<_BlessingDetailContent> createState() => _BlessingDetailContentState();
}

class _BlessingDetailContentState extends State<_BlessingDetailContent> {
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
                        icon: Image.asset('assets/icons/cart.png', width: 28, height: 28),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.cart); // Navigate to CartScreen
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.item.imagePath,
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.item.title,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontFamily: 'NotoSansThai',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.item.price.toString(),
                  style: const TextStyle(
                    fontSize: 26,
                    color: Color(0xFF19C3A3),
                    fontFamily: 'NotoSansThai',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.item.description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'NotoSansThai',
                    ),
                    textAlign: TextAlign.center,
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
                          Text(
                            '$_quantity',
                            style: const TextStyle(fontSize: 18, fontFamily: 'NotoSansThai'),
                          ),
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
                          final cartBlessingItem = CartBlessingItem(
                            title: widget.item.title,
                            price: widget.item.price.toDouble(),
                            description: widget.item.description,
                            imagePath: widget.item.imagePath,
                          );
                          cartProvider.addItem(
                              cartBlessingItem,
                              widget.item.price.toDouble(),
                              _quantity // ส่งค่า _quantity ที่ผู้ใช้เลือก
                          );
                          print('Add $_quantity of ${widget.item.title} to cart');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('เพิ่ม ${widget.item.title} x $_quantity ลงในตะกร้าแล้ว')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF19C3A3),
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