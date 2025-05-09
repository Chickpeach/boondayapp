import 'package:flutter/material.dart';
import 'package:boonday/routes/app_routes.dart'; // Import your AppRoutes

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ปุ่มย้อนกลับ
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/back.png',
                      width: 28,
                      height: 28,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
                    },
                  ),
                  // หัวข้อ
                  Text(
                    'ประวัติการทำบุญ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  // ปุ่มตะกร้าสินค้า เปลี่ยนเป็น cart.png และนำทางไปหน้า CartScreen
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/cart.png',
                      width: 28,
                      height: 28,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.cart); // นำทางไปยัง CartScreen
                    },
                  ),
                ],
              ),
            ),

            // ข้อความข้อมูลล่าสุด
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '* ข้อมูลล่าสุด ณ วันที่ 16 / 05 / 25 จากผู้ใช้งาน Boonday ทั่วประเทศ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8), // ระยะห่างก่อน list

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  DonationCard(
                    organization: 'มูลนิธิราชวิถี',
                    amount: 9000,
                    date: '15 เม.ย 68',
                    logoPath: 'assets/images/foundation3.png',
                  ),
                  DonationCard(
                    organization: 'มูลนิธิราชวิถี',
                    amount: 50000,
                    date: '10 เม.ย 68',
                    logoPath: 'assets/images/foundation3.png',
                  ),
                  DonationCard(
                    organization: 'มูลนิธิศูนย์พักก์',
                    amount: 1000,
                    date: '5 เม.ย 68',
                    logoPath: 'assets/images/foundation2.png',
                  ),
                  DonationCard(
                    organization: 'มูลนิธิยุวพัฒน์',
                    amount: 3500,
                    date: '2 เม.ย 68',
                    logoPath: 'assets/images/foundation5.png',
                  ),
                  DonationCard(
                    organization: 'มูลนิธิศิริราช',
                    amount: 6000,
                    date: '1 เม.ย 68',
                    logoPath: 'assets/images/foundation1.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ไม่ต้องแก้ class นี้
class DonationCard extends StatelessWidget {
  final String organization;
  final int amount;
  final String date;
  final String logoPath;

  const DonationCard({
    Key? key,
    required this.organization,
    required this.amount,
    required this.date,
    required this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            logoPath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'บริจาคให้ $organization',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '$amount บาท',
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              'เมื่อวันที่ $date',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
