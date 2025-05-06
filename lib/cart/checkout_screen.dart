import 'package:flutter/material.dart';
import 'package:boonday/routes/app_routes.dart'; // Import AppRoutes
import 'package:provider/provider.dart'; // Import Provider
import '../cart/cart_provider.dart'; // Import CartProvider

class CheckoutScreen extends StatefulWidget { // เปลี่ยนเป็น StatefulWidget
  final String? qrCodeData;
  final String bankName;
  final String accountNumber;
  final double totalPrice; // ตัวแปรสำหรับราคารวม

  const CheckoutScreen({
    Key? key,
    required this.qrCodeData,
    required this.bankName,
    required this.accountNumber,
    required this.totalPrice, // รับค่า totalPrice ใน Constructor
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState(); // สร้าง State
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isConfirmingPayment = false; // State สำหรับควบคุมสถานะการโหลด

  Future<void> _confirmPayment() async {
    setState(() {
      _isConfirmingPayment = true; // เริ่มแสดง Animation หมุนๆ
    });

    // TODO: ใส่ Logic การชำระเงินจริง (ถ้ามี) ตรงนี้

    // จำลองการทำงานของการชำระเงิน (หน่วงเวลา 3 วินาที)
    await Future.delayed(const Duration(seconds: 3));

    // เข้าถึง CartProvider และล้างตะกร้า
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.clear(); // หรือ cartProvider.removeAllItems(); แล้วแต่ Function ที่คุณสร้างไว้

    setState(() {
      _isConfirmingPayment = false; // หยุดแสดง Animation หมุนๆ
    });

    // นำทางไปยังหน้า History โดยใช้ AppRoutes.history
    Navigator.pushReplacementNamed(context, AppRoutes.history);
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
          child: SingleChildScrollView( // เพิ่ม SingleChildScrollView หากเนื้อหายาวเกินไป
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.payment, size: 80.0, color: Colors.green),
                const SizedBox(height: 16.0),
                const Text('สแกน QR Code เพื่อชำระเงิน',
                    style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansThai',),
                    textAlign: TextAlign.center),
                const SizedBox(height: 24.0),
                Image.asset(
                  'assets/images/BOONDAY_qrcode.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24.0),
                Text(widget.bankName,
                  style: const TextStyle(fontWeight:
                  FontWeight.bold,
                    fontFamily: 'NotoSansThai',
                    color: Color(0xFF19C3A3,),
                  ),
                ),
                Text(
                  'เลขบัญชี : ${widget.accountNumber}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'NotoSansThai',
                    color: Colors.purple, // เปลี่ยนเป็นสีที่คุณต้องการ
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'ยอดที่ต้องชำระ: ${widget.totalPrice.toStringAsFixed(2)} บาท', // แสดงราคารวม
                  style: const TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansThai',
                    color: Color(0xFFF68CBA),
                  ),
                ),
                const SizedBox(height: 32.0),
                const Text('เมื่อชำระเงินเสร็จสิ้นแล้วกรุณากดยืนยัน',
                    style: TextStyle(fontSize: 14.0,
                        fontFamily: 'NotoSansThai',
                        color: Colors.grey),
                    textAlign: TextAlign.center),
                const SizedBox(height: 24.0), // เพิ่ม SizedBox เพื่อเว้นระยะ
                ElevatedButton(
                  onPressed: _isConfirmingPayment ? null : _confirmPayment, // เรียก _confirmPayment เมื่อปุ่มถูกกด
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19C3A3), // สีเขียวสดใส (ค่า Hex เดียวกับปุ่ม Check out โดยประมาณ)
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // ทำให้ขอบโค้งมนมาก
                    ),
                  ),
                  child: _isConfirmingPayment // แสดง CircularProgressIndicator ถ้ารอการยืนยัน
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                      : const Text(
                    'ยืนยันการชำระเงิน',
                    style: TextStyle(fontSize: 18.0,
                        fontFamily: 'NotoSansThai',
                        color: Colors.white),
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