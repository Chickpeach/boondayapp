import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_item.dart';
import 'fortune_item.dart'; // Import FortuneItem
import 'blessing_item.dart'; // Import BlessingItem
import 'CartMakemerit_Item.dart'; // Import CartMakemerit_Item
import 'checkout_screen.dart'; // Import หน้า CheckoutScreen

class CartScreen extends StatelessWidget { // หรือ StatefulWidget ถ้าคุณต้องการใช้ initState
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CartScreen build() called'); // <--- เพิ่มตรงนี้
    final cartProvider = Provider.of<CartProvider>(context);
    print('Item count: ${cartProvider.items.length}'); // <--- เพิ่มตรงนี้

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ตะกร้าสินค้า',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSansThai',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.items[index];
                print('Item at index $index: ${cartItem.item.toString()} - Quantity: ${cartItem.quantity}'); // <--- เพิ่มตรงนี้
                return CartItemCard(cartItem: cartItem);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'ราคารวม: ${cartProvider.totalPrice.toStringAsFixed(2)} บาท',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF68CBA),
                    fontFamily: 'NotoSansThai',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: cartProvider.items.isEmpty
                      ? null // ถ้าตะกร้าว่าง ให้ onPressed เป็น null (กดไม่ได้)
                      : () {
                    // TODO: สร้างข้อมูล QR Code และข้อมูลบัญชีจริง
                    const String qrCodeData = 'YOUR_QR_CODE_DATA';
                    const String bankName = 'BOONPAY';
                    const String accountNumber = '123123123123';

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutScreen( // <--- เอา const ออกแล้ว
                          qrCodeData: qrCodeData,
                          bankName: bankName,
                          accountNumber: accountNumber,
                          totalPrice: cartProvider.totalPrice, // <--- เพิ่ม totalPrice ตรงนี้
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19C3A3),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    // คุณสามารถกำหนด backgroundColor เมื่อปุ่ม disabled ได้ที่นี่ ถ้าต้องการ
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: const Text(
                    'ดำเนินการต่อ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansThai',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    Widget imageWidget = const SizedBox(width: 80, height: 80);
    String itemName = 'Unknown';

    if (cartItem.item is FortuneItem) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          (cartItem.item as FortuneItem).imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
      itemName = (cartItem.item as FortuneItem).title;
    } else if (cartItem.item is CartBlessingItem) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          (cartItem.item as CartBlessingItem).imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
      itemName = (cartItem.item as CartBlessingItem).title;
    } else if (cartItem.item is CartMakemeritItem) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          (cartItem.item as CartMakemeritItem).imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
      itemName = (cartItem.item as CartMakemeritItem).title;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: imageWidget,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansThai',
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    'ราคา: ${cartItem.price.toStringAsFixed(2)} บาท',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansThai',
                      color: Color(0xFFF68CBA),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // จัดวางปุ่มให้ชิดขอบ
              children: [
                Row(
                  children: [
                    CircleAvatar( // ปุ่มลด (-)
                      backgroundColor: const Color(0xFF19C3A3),
                      radius: 12,
                      child: IconButton(
                        icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                        onPressed: () {
                          cartProvider.changeItemQuantity(cartItem, cartItem.quantity - 1);
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${cartItem.quantity}',
                      style: const TextStyle(fontFamily: 'NotoSansThai', fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar( // ปุ่มเพิ่ม (+)
                      backgroundColor: const Color(0xFF19C3A3),
                      radius: 12,
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white, size: 18),
                        onPressed: () {
                          cartProvider.changeItemQuantity(cartItem, cartItem.quantity + 1);
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
                      ),
                    ),
                  ],
                ),
                IconButton( // ปุ่มลบ (ถังขยะ)
                  icon: const Icon(Icons.delete, color: Color(0xFFF68CBA), size: 24),
                  onPressed: () {
                    cartProvider.removeItem(cartItem);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}