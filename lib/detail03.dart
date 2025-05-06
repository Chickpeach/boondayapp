import 'package:flutter/material.dart';
import 'donate01.dart'; // ต้องมี Donate widget ที่รับ foundationName และ foundationImage


class DetailFoundation03 extends StatefulWidget {
  const DetailFoundation03({super.key});

  @override
  State<DetailFoundation03> createState() => _DetailFoundation03State();
}

class _DetailFoundation03State extends State<DetailFoundation03> {
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
                          "มูลนิธิกระจกเงา",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: _buildImage('assets/images/foundation4.png', size: 300),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "รายละเอียดมูลนิธิกระจกเงา",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "ชื่อภาษาอังกฤษ : The Mirror foundation\n"
                              "ประเภทองค์กร : องค์กรไม่แสวงหาผลกำไร\n"
                              "วัตถุประสงค์ : สร้างสังคมแห่งการเรียนรู้ที่เข้มแข็งและมีความสุข สร้างการเปลี่ยนแปลงสังคม ร่วมแก้ปัญหาสังคมไปสู่สิ่งที่ดีกว่า\n"
                              "เพื่อช่วยเหลือคนไร้บ้าน การบริจาคสิ่งของผ่านโครงการ “แบ่งปันเพื่อเปลี่ยนชีวิต” ไปจนถึงการพัฒนาระบบฐานข้อมูลเพื่อสาธารณประโยชน์\n"
                              "และเป็นพื้นที่กลางในการขับเคลื่อนความเปลี่ยนแปลงร่วมกัน ทุกบาทของคุณจะเป็นเสมือนแสงไฟเล็ก ๆ ที่นำทางให้ใครบางคนได้กลับบ้าน กลับมามีชีวิตอีกครั้ง\n"
                              "\nสายด่วน : 061-909-1840\n"
                              "เว็บไซต์ : https://www.mirror.or.th/\n"
                              "ที่ตั้ง :  เลขที่ 191 ซอยวิภาวดี 62 (แยก 4-7) ถนนวิภาวดีรังสิต",
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
                                  foundationName: 'มูลนิธิกระจกเงา',
                                  foundationImage: 'foundation4.png',
                                  imagePath: 'donate4.png',
                                  accountName: 'The Mirror Foundation',
                                  bankName: 'Prompt Pay',
                                  accountNumber: '099300015183602',
                                  thankYouTitle: 'มูลนิธิกระจกเงา',
                                  thankYouSubTitle: 'ขอบคุณที่เลือกสะท้อนความหวังให้สังคม',
                                  thankYouBodyText: 'จากใจทีมงานและผู้คนที่คุณอาจไม่เคยพบเจอ ขอบคุณที่คุณเห็น “ตัวตน” ของคนไร้บ้าน เด็กหาย และผู้ถูกหลงลืมในสังคม การบริจาคของคุณคือแสงสว่างที่สะท้อนออกมาจากกระจกเงาบานหนึ่ง ให้ความหวัง ความเปลี่ยนแปลง และชีวิตใหม่สำหรับผู้ที่ไม่มีใคร แม้คุณจะไม่ได้รู้จักพวกเขาโดยตรง แต่เขาจะจดจำได้ว่า เคยมีใครบางคนที่เลือกจะไม่เมินผ่าน',
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
