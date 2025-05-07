import 'package:flutter/material.dart';
import 'donate01.dart'; // ต้องมี Donate widget ที่รับ foundationName และ foundationImage

class DetailFoundation04 extends StatefulWidget {
  const DetailFoundation04({super.key});

  @override
  State<DetailFoundation04> createState() => _DetailFoundation04State();
}

class _DetailFoundation04State extends State<DetailFoundation04> {
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
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
                      const SizedBox(height: 20),
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
                          "มูลนิธิยุวพัฒน์",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: _buildImage('assets/images/foundation5.png', size: 300),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "รายละเอียดมูลนิธิยุวพัฒน์",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "ชื่อภาษาอังกฤษ : Yuvabadhana Foundation\n"
                              "ประเภทองค์กร : องค์กรไม่แสวงหาผลกำไร\n"
                              "วัตถุประสงค์ : มุ่งเน้นสร้างโอกาสและพัฒนาการศึกษาแก่เยาวชนที่ขาดโอกาส ซึ่งเกิดจากความร่วมมือและการมีส่วนร่วมของคนในสังคมผ่านการช่วยเหลือทั้งในรูปแบบทุนมนุษย์และทุนทรัพย์ เพื่อการสร้างจิตสำนึกของการมีส่วนร่วม\n"
                              "เพื่อส่วนรวม และเพื่อปลูกฝังจริยธรรมในสถานศึกษาอีกด้วย การบริจาคของคุณจึงไม่ใช่แค่ค่าเล่าเรียน แต่คือการปลูกฝังศักยภาพให้คนรุ่นใหม่ที่พร้อมจะเติบโตเป็นพลเมืองดีของสังคม\n"
                              "\nสายด่วน : 02 301 1093\n"
                              "เว็บไซต์ : yuvabadhanafoundation.org\n"
                              "ที่ตั้ง : เลขที่ 1 อาคารพรีเมียร์คอร์เปอเรทปาร์ค ซอยพรีเมียร์ 2 ถนนศรีนครินทร์ แขวงหนองบอน เขตประเวศ กรุงเทพ 10250",
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
                                  foundationName: 'มูลนิธิยุวพัฒน์',
                                  foundationImage: 'foundation5.png',
                                  imagePath: 'donate5.png',
                                  accountName: 'มูลนิธิยุวพัฒน์',
                                  bankName: 'ธนาคารกสิกรไทย',
                                  accountNumber: '095-2-15120-7',
                                  thankYouTitle: 'มูลนิธิยุวพัฒน์',
                                  thankYouSubTitle: 'เพราะการศึกษาไม่ควรเป็นสิ่งหรูหรา ขอบคุณที่เห็นคุณค่าของอนาคต',
                                  thankYouBodyText: 'ทุกบาทของคุณ คือบทเรียนที่ต่อเนื่องให้นักเรียนขาดโอกาสได้มีพรุ่งนี้ที่สดใส ขอบคุณที่เลือกเป็นผู้สนับสนุนความฝันของเด็กคนหนึ่งที่อยากเรียน อยากโตขึ้นเป็นคนดี อยากเปลี่ยนชีวิตของตนเองและครอบครัว มูลนิธิยุวพัฒน์ขอขอบคุณจากหัวใจ ที่คุณช่วยเปลี่ยนโชคชะตาด้วยพลังแห่งปัญญา',
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: _buildImage('assets/icons/back.png', size: 35),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: _buildImage('assets/icons/cart.png', size: 28),
          onPressed: () {
            Navigator.pushNamed(context, '/cart'); // แก้ตามชื่อ route จริงของคุณ
          },
        ),
      ],
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