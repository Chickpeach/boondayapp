import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
                  Icon(Icons.arrow_back, size: 28),
                  Text(
                    'ประวัติการทำบุญ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  Icon(Icons.shopping_cart_outlined, size: 28),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  DonationCard(
                    organization: 'มูลนิธิศูนย์พักก์',
                    amount: 999,
                    date: '5 เม.ย 68',
                    logoPath: 'assets/images/logo1.png',
                  ),
                  DonationCard(
                    organization: 'มูลนิธิยุวพัฒน์',
                    amount: 444,
                    date: '2 เม.ย 68',
                    logoPath: 'assets/images/logo2.png',
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

class DonationCard extends StatelessWidget {
  final String organization;
  final int amount;
  final String date;
  final String logoPath;

  const DonationCard({
    super.key,
    required this.organization,
    required this.amount,
    required this.date,
    required this.logoPath,
  });

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
