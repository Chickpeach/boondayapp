import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ชำระเงิน',
          style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'NotoSansThai',),
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
              Text(bankName,
                style: const TextStyle(fontWeight:
                FontWeight.bold,
                  fontFamily: 'NotoSansThai',
                  color: Color(0xFF19C3A3,),
                ),
              ),
              Text(
                'เลขบัญชี : $accountNumber',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'NotoSansThai',
                  color: Colors.purple, // เปลี่ยนเป็นสีที่คุณต้องการ
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'ยอดที่ต้องชำระ: ${totalPrice.toStringAsFixed(2)} บาท', // แสดงราคารวม
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
                onPressed: () {
                  // TODO: ใส่ Logic เมื่อผู้ใช้กดปุ่ม "ยืนยันการชำระเงิน"
                  print('ผู้ใช้ยืนยันการชำระเงินแล้ว');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF19C3A3), // สีเขียวสดใส (ค่า Hex เดียวกับปุ่ม Check out โดยประมาณ)
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0), // ทำให้ขอบโค้งมนมาก
                  ),
                ),
                child: const Text(
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
    );
  }
}