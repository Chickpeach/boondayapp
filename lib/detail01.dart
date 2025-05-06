import 'package:flutter/material.dart';
import 'donate01.dart'; // ต้องมี Donate widget ที่รับ foundationName และ foundationImage


class DetailFoundation01 extends StatefulWidget {
  const DetailFoundation01({super.key});

  @override
  State<DetailFoundation01> createState() => _DetailFoundation01State();
}

class _DetailFoundation01State extends State<DetailFoundation01> {
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
                          "มูลนิธิศูนย์พิทักษ์เด็ก",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: _buildImage('assets/images/foundation2.png', size: 350),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "รายละเอียดมูลนิธิศูนย์พิทักษ์เด็ก",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "ชื่อภาษาอังกฤษ : Foundation for Child Rights Protection Center (CRPC)\n"
                              "ประเภทองค์กร : องค์กรไม่แสวงหาผลกำไร\n"
                              "วัตถุประสงค์ : คุ้มครองสิทธิเด็ก ส่งเสริมคุณภาพชีวิต และฟื้นฟูเด็กที่ถูกละเมิดสิทธิ ทั้งในด้านร่างกาย จิตใจ และสังคม ที่ให้ความช่วยเหลือเด็กที่ถูกละเมิดสิทธิ เช่น ความรุนแรงในครอบครัว การล่วงละเมิด หรือการถูกทอดทิ้ง ทั้งด้านกฎหมาย จิตใจ และสังคม\n"
                              "ทำงานเชิงรณรงค์และนโยบาย เพื่อผลักดันการคุ้มครองสิทธิเด็กในระดับประเทศ\n\n"
                              "สายด่วน : 02-412-1196\n"
                              "เว็บไซต์ : thaichildrights.org\n"
                              "ที่ตั้ง : กรุงเทพฯ (เพชรเกษม 63)",
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
                                  foundationName: 'มูลนิธิศูนย์พิทักษ์เด็ก',
                                  foundationImage: 'foundation2.png',
                                  imagePath: 'donate2.png',
                                  accountName: 'มูลนิธิศูนย์พิทักษ์เด็ก',
                                  bankName: 'Prompt Pay',
                                  accountNumber: '099300039694491',
                                  thankYouTitle: 'มูลนิธิศูนย์พิทักษ์เด็ก',
                                  thankYouSubTitle: 'คุณคือความปลอดภัยที่จับต้องได้ของเด็กคนหนึ่ง',
                                  thankYouBodyText: 'ขอบคุณที่ไม่เมินเฉยต่อเสียงที่เบาแผ่วที่สุดของเด็ก ๆ ที่ต้องการความช่วยเหลือ การบริจาคของคุณคือการส่งมอบโอกาสใหม่ให้ชีวิตที่เคยถูกทำร้ายได้กลับมายิ้มได้อีกครั้ง ทีมงานทุกคนของมูลนิธิศูนย์พิทักษ์เด็กขอขอบคุณจากใจที่คุณเลือกยืนเคียงข้างเด็ก ๆ เหล่านี้ และหวังว่าเราจะได้ร่วมเดินทางแห่งการเปลี่ยนแปลงนี้ไปด้วยกันอีกในวันข้างหน้า',
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
