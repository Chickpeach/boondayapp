class CartItem {
  final dynamic item; // สามารถเป็น BlessingItem, FortuneItem, หรือ MakemeritItem ก็ได้
  int quantity;
  double price; // เพิ่ม price เพื่อความสะดวกในการคำนวณราคารวม

  CartItem({
    required this.item,
    required this.quantity,
    required this.price,
  });
}