import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Import material.dart สำหรับ ChangeNotifier
import 'cart_item.dart'; // Import CartItem class ที่เราสร้างไว้
import 'fortune_item.dart'; // Import FortuneItem
import 'blessing_item.dart'; // Import BlessingItem
import 'CartMakemerit_Item.dart'; // Import CartMakemerit_Item

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    var total = 0.0;
    for (var item in _items) {
      total += item.price; // ใช้ราคาที่คำนวณไว้ใน CartItem แล้ว
    }
    return total;
  }

  void addItem(dynamic item, double price, [int quantity = 1]) {
    if (item is FortuneItem) {
      final existingIndex = _items.indexWhere((cartItem) =>
      cartItem.item is FortuneItem &&
          (cartItem.item as FortuneItem).title == item.title); // เปรียบเทียบด้วย title

      if (existingIndex >= 0) {
        _items[existingIndex].quantity += quantity; // เพิ่มจำนวนตาม quantity ที่ส่งมา
        _items[existingIndex].price = _getPricePerUnit(item) * _items[existingIndex].quantity;
        print('CartProvider: เพิ่มจำนวน ${item.title} เป็น ${_items[existingIndex].quantity}'); // <--- เพิ่มตรงนี้
      } else {
        _items.add(
          CartItem(item: item, quantity: quantity, price: price * quantity), // เพิ่ม CartItem ใหม่พร้อม quantity
        );
        print('CartProvider: เพิ่ม ${item.title} จำนวน $quantity ในตะกร้า'); // <--- เพิ่มตรงนี้
      }
      notifyListeners();
    } else if (item is CartBlessingItem) {
      final existingIndex = _items.indexWhere((cartItem) =>
      cartItem.item is CartBlessingItem &&
          (cartItem.item as CartBlessingItem).title == item.title); // เปรียบเทียบด้วย title

      if (existingIndex >= 0) {
        _items[existingIndex].quantity += quantity; // เพิ่มจำนวนตาม quantity ที่ส่งมา
        _items[existingIndex].price = _getPricePerUnit(item) * _items[existingIndex].quantity;
        print('CartProvider: เพิ่มจำนวน ${item.title} เป็น ${_items[existingIndex].quantity}'); // <--- เพิ่มตรงนี้
      } else {
        _items.add(
          CartItem(item: item, quantity: quantity, price: price * quantity), // เพิ่ม CartItem ใหม่พร้อม quantity
        );
        print('CartProvider: เพิ่ม ${item.title} จำนวน $quantity ในตะกร้า'); // <--- เพิ่มตรงนี้
      }
      notifyListeners();
    } else if (item is CartMakemeritItem) { // เพิ่มเงื่อนไขสำหรับ CartMakemeritItem
      final existingIndex = _items.indexWhere((cartItem) =>
      cartItem.item is CartMakemeritItem &&
          (cartItem.item as CartMakemeritItem).title == item.title); // เปรียบเทียบด้วย title

      if (existingIndex >= 0) {
        _items[existingIndex].quantity += quantity; // เพิ่มจำนวนตาม quantity ที่ส่งมา
        _items[existingIndex].price = _getPricePerUnit(item) * _items[existingIndex].quantity;
        print('CartProvider: เพิ่มจำนวน ${item.title} เป็น ${_items[existingIndex].quantity}'); // <--- เพิ่มตรงนี้
      } else {
        _items.add(
          CartItem(item: item, quantity: quantity, price: price * quantity), // เพิ่ม CartItem ใหม่พร้อม quantity
        );
        print('CartProvider: เพิ่ม ${item.title} จำนวน $quantity ในตะกร้า'); // <--- เพิ่มตรงนี้
      }
      notifyListeners();
    } else {
      print('ไม่สามารถเพิ่มสินค้านี้ได้ในขณะนี้');
    }
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void changeItemQuantity(CartItem item, int quantity) {
    if (quantity > 0) {
      item.quantity = quantity;
      item.price = _getPricePerUnit(item.item) * quantity;
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double _getPricePerUnit(dynamic item) {
    if (item is FortuneItem) {
      return double.parse(item.price.replaceAll(' บาท', ''));
    } else if (item is CartBlessingItem) {
      return item.price.toDouble();
    } else if (item is CartMakemeritItem) { // เพิ่มเงื่อนไขสำหรับ CartMakemeritItem
      return item.price.toDouble();
    }
    return 0.0; // Default หากไม่ใช่ FortuneItem, BlessingItem หรือ CartMakemeritItem
  }
}