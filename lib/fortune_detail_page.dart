import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart/cart_provider.dart'; // Import CartProvider
import 'package:boonday/routes/app_routes.dart'; // Import AppRoutes
import 'cart/fortune_item.dart'; // Import FortuneItem

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
      backgroundColor: Colors.white,
      body: _FortuneDetailContent(
        title: title,
        price: price,
        description: description,
        imagePath: imagePath,
      ),
    );
  }
}

class _FortuneDetailContent extends StatefulWidget {
  // เปลี่ยนเป็น StatefulWidget
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
  State<_FortuneDetailContent> createState() => _FortuneDetailContentState();
}

class _FortuneDetailContentState extends State<_FortuneDetailContent> {
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
                  icon: Image.asset('assets/icons/cart.png', width: 28, height: 28),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.cart); // ใช้ AppRoutes.cart
                  },
                ),
              ],
            ),
          ),
          Expanded(
            // เพิ่ม Expanded ที่นี่
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Image in square shape
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.imagePath,
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Product Title
                  Text(
                    widget.title,
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
                    widget.price,
                    style: const TextStyle(
                      fontSize: 26, // ใหญ่ขึ้น
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
                      widget.description,
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
          ),
          // Quantity Control and Add to Cart Button
          Padding(
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
                        Text('$_quantity',
                            style: const TextStyle(fontSize: 18, fontFamily: 'NotoSansThai')),
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
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                          final fortuneItem = FortuneItem(
                            title: widget.title,
                            price: widget.price,
                            description: widget.description,
                            imagePath: widget.imagePath,
                          );
                          cartProvider.addItem(
                              fortuneItem,
                              double.parse(widget.price.replaceAll(' บาท', '')));
                          print('Add $_quantity of ${widget.title} to cart');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'เพิ่ม ${widget.title} x $_quantity ลงในตะกร้าแล้ว')),
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
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSansThai'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}