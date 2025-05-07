import 'package:boonday/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:boonday/thankyoudonate.dart';
import 'package:intl/intl.dart';

class PaymentDonate extends StatelessWidget {
  final String amount;
  final String imagePath;
  final String accountName;
  final String bankName;
  final String accountNumber;
  final String thankYouTitle;
  final String thankYouSubTitle;
  final String thankYouBodyText;

  const PaymentDonate({
    super.key,
    required this.amount,
    required this.imagePath,
    required this.accountName,
    required this.bankName,
    required this.accountNumber,
    required this.thankYouTitle,
    required this.thankYouSubTitle,
    required this.thankYouBodyText,
  });

  String _formatAmount(String value) {
    try {
      final number = double.parse(value);
      final formatter = NumberFormat("#,##0.00", "en_US");
      return formatter.format(number);
    } catch (e) {
      return value;
    }
  }

  Widget _buildImage(String path, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          path,
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImage(
                      'assets/icons/back.png',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildImage('assets/icons/cart.png'), // Placeholder สำหรับไอคอนฝั่งขวา (ถ้ามี)
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "สแกน QR Code\nเพื่อทำการบริจาค",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E8B58),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 23),
                      Image.asset(
                        'assets/images/$imagePath',
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "${_formatAmount(amount)} บาทถ้วน",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF19C3A3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "ชื่อบัญชี: $accountName\nธนาคาร: $bankName\nเลขที่บัญชี: $accountNumber",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "เมื่อสแกนแล้วกรุณากดยืนยัน",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF19C3A3),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        onPressed: () {
                          // นำทางไปยังหน้าหลัก (MainScreen) และลบ routes อื่นๆ ใน stack
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.mainScreen, // <--- ใช้ AppRoutes.mainScreen
                                (route) => false,
                          );
                        },
                        child: Text(
                          "ยืนยันการบริจาค",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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