import 'package:flutter/material.dart';
import 'donate01.dart'; // ต้องมี Donate widget ที่รับ foundationName และ foundationImage


class DetailFoundation05 extends StatefulWidget {
  const DetailFoundation05({super.key});

  @override
  State<DetailFoundation05> createState() => _DetailFoundation05State();
}

class _DetailFoundation05State extends State<DetailFoundation05> {
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildImage('assets/images/menu.png'),
                          _buildImage('assets/images/time.png'),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 31),
                        child: Text(
                          "รายละเอียดผู้รับบริจาค",
                          style: TextStyle(
                            color: const Color(0xFF2E8B58),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Text(
                          "มูลนิธิช่วยชีวิตสัตว์ป่า",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: _buildImage('assets/images/foundation6.png', size: 300),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "รายละเอียดมูลนิธิช่วยชีวิตสัตว์ป่า",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "ชื่อภาษาอังกฤษ : Wildlife Saving Foundation of Thailand\n"
                              "ประเภทองค์กร : องค์กรไม่แสวงหาผลกำไร\n"
                              "วัตถุประสงค์ : ช่วยเหลือสัตว์ป่า โดยเฉพาะอย่างยิ่งสัตว์ป่าที่พิการหรือถูกทารุน ไม่ว่าด้วยวิธีการใด ๆ ให้กลับมามีชีวิตใกล้เคียงกับธรรมชาติ\n"
                              "ส่งเสริมการรักษาความสมดุลทางธรรมชาติและระบบนิเวศ ซึ่งสำคัญอย่างยิ่งต่อชีวิตสัตว์ป่าในอนาคต เพื่อลดการคุกคามสัตว์ป่า เงินบริจาคของคุณจะช่วยให้สัตว์เหล่านี้มีบ้าน มีอาหาร มีทีมดูแล และสำคัญที่สุดคือ “โอกาสในการมีชีวิตอยู่ตามธรรมชาติอีกครั้ง”\n"
                              "\nสายด่วน : 1136 และ 1362\n"
                              "เว็บไซต์ : https://www.wildlifeofthailand.org/th/\n"
                              "ที่ตั้ง : มูลนิธิช่วยชีวิตสัตว์ป่าแห่งประเทศไทย (สำนักงานใหญ่ กรุงเทพฯ)357/16 ซอยนวมินทร์ 111 ถนนนวมินทร์ แขวงนวมินทร์ เขตบึงกุ่ม กรุงเทพมหานคร 10230",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 52),
                      Center(
                        child: InkWell(
                          onTap: isLocked
                              ? null
                              : () {
                            setState(() {
                              isLocked = true;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Donate(
                                  foundationName: 'มูลนิธิช่วยชีวิตสัตว์ป่า',
                                  foundationImage: 'foundation6.png',
                                  imagePath: 'donate6.png',
                                  accountName: 'The Wild Animal Rescue Foundation of Tha',
                                  bankName: 'Prompt Pay',
                                  accountNumber: '099300018733490',
                                  thankYouTitle: 'มูลนิธิช่วยชีวิตสัตว์ป่า',
                                  thankYouSubTitle: 'เสียงที่ไร้คำพูดของธรรมชาติ ได้รับการตอบกลับจากคุณ',
                                  thankYouBodyText: ' ขอบคุณที่ไม่ละเลยเสียงกระซิบของสัตว์ป่าที่ไร้โอกาสในการเรียกร้องสิทธิ์ของตัวเอง ทุกการบริจาคของคุณคือการให้พวกมันได้กลับคืนสู่ผืนป่าที่ควรเป็นบ้านของพวกมัน ได้รับการรักษา และมีชีวิตต่ออย่างที่ธรรมชาติสร้างไว้ ขอบคุณที่ร่วมกันปกป้องความหลากหลายทางชีวภาพ และเป็นพลังสำคัญในการอนุรักษ์ธรรมชาติให้คนรุ่นหลัง',
                                ),
                              ),
                            ).then((_) {
                              // ปลดล็อคเมื่อกลับมา
                              setState(() {
                                isLocked = false;
                              });
                            });
                          },
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: const Color(0xFF19C3A3),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            child: Text(
                              "บริจาค",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path, {double size = 35}) {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          color: Colors.grey,
          child: const Icon(Icons.error),
        );
      },
    );
  }
}
