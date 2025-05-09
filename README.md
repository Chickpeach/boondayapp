# boondayapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

มาเอาโค้ดค่ะพี่
import 'package:flutter/material.dart';
import 'package:boonday/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../cart/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  final String? qrCodeData;
  final String bankName;
  final String accountNumber;
  final double totalPrice;

  const CheckoutScreen({
    Key? key,
    required this.qrCodeData,
    required this.bankName,
    required this.accountNumber,
    required this.totalPrice,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isConfirmingPayment = false;

  Future<void> _confirmPayment() async {
    setState(() {
      _isConfirmingPayment = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    // เคลียร์ตะกร้า
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.clear();

    setState(() {
      _isConfirmingPayment = false;
    });

    // แสดง popup
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF68CBA), // ชมพูหวาน
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            'ขอบคุณที่ใช้บริการ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NotoSansThai',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: const Text(
            'สามารถตรวจสอบรายการสั่งซื้อได้ที่แอป Boonday Official (แอปเขียว)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NotoSansThai',
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.mainScreen,
                      (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF19C3A3), // เขียวมิ้นต์
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ชำระเงิน',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSansThai',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.payment, size: 80.0, color: Colors.green),
                const SizedBox(height: 16.0),
                const Text(
                  'สแกน QR Code เพื่อชำระเงิน',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansThai',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                Image.asset(
                  'assets/images/BOONDAY_qrcode.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24.0),
                Text(
                  widget.bankName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansThai',
                    color: Color(0xFF19C3A3),
                  ),
                ),
                Text(
                  'เลขบัญชี : ${widget.accountNumber}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'NotoSansThai',
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'ยอดที่ต้องชำระ: ${widget.totalPrice.toStringAsFixed(2)} บาท',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansThai',
                    color: Color(0xFFF68CBA),
                  ),
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'เมื่อชำระเงินเสร็จสิ้นแล้วกรุณากดยืนยัน',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'NotoSansThai',
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _isConfirmingPayment ? null : _confirmPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19C3A3),
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: _isConfirmingPayment
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                      : const Text(
                    'ยืนยันการชำระเงิน',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'NotoSansThai',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
