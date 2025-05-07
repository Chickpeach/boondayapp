import 'package:flutter/material.dart';
import 'donate01.dart'; // ต้องมี Donate widget ที่รับ foundationName และ foundationImage

class DetailFoundation02 extends StatefulWidget {
  const DetailFoundation02({super.key});

  @override
  State<DetailFoundation02> createState() => _DetailFoundation02State();
}

class _DetailFoundation02State extends State<DetailFoundation02> {
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
                          "มูลนิธิโรงพยาบาลราชวิถี",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: _buildImage('assets/images/foundation3.png', size: 300),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "รายละเอียดมูลนิธิโรงพยาบาลราชวิถี",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "ชื่อภาษาอังกฤษ : .RAJAVITHI FOUNDATION\n"
                              "ประเภทองค์กร : องค์กรไม่แสวงหาผลกำไร\n"
                              "วัตถุประสงค์ : เพื่อให้การช่วยเหลือผู้ป่วยที่ขาดแคลนทุนทรัพย์ให้ได้รับโอกาสในการรักษาอย่างดีที่สุด อีกทั้งยังส่งเสริม ช่วยเหลืองานค้นคว้าวิจัยและวิชาการแก่เจ้าหน้าที่เพื่อเป็นข้อมูลนำไปต่อยอดพัฒนาในการรักษาผู้ป่วยต่อไป\n"
                              "เพื่อให้บุคลากรสามารถดูแลผู้ป่วยได้อย่างมีประสิทธิภาพสูงสุด เพราะสำหรับบางคน ความหวังในการหายป่วยอยู่ที่คุณ\n"
                              "สายด่วน : 0-2354-7996\n"
                              "เว็บไซต์ : https://www.rajavithifoundation.com/\n"
                              "ที่ตั้ง : เลขที่ 2 ถนนพญาไท เขตราชเทวี กรุงเทพมหานคร 10400",
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
                                  foundationName: 'มูลนิธิโรงพยาบาลราชวิถี',
                                  foundationImage: 'foundation3.png',
                                  imagePath: 'donate3.png',
                                  accountName: 'มูลนิธิโรงพยาบาลราชวิถี',
                                  bankName: 'Prompt Pay',
                                  accountNumber: '099300018733490',
                                  thankYouTitle: 'มูลนิธิโรงพยาบาลราชวิถี',
                                  thankYouSubTitle: 'จากความหวังเล็ก ๆ สู่การรักษาที่ไม่สิ้นสุด',
                                  thankYouBodyText: 'คำขอบคุณจากมูลนิธิราชวิถีอาจยังไม่เพียงพอเท่ากับรอยยิ้มที่คุณได้มอบให้ผู้ป่วยที่ได้รับโอกาสในการรักษาอย่างเหมาะสมและทันเวลา ทุกการบริจาคของคุณได้กลายเป็นพลังให้กับบุคลากรทางการแพทย์ และเป็นเส้นทางแห่งความหวังใหม่สำหรับคนที่กำลังเผชิญโรคร้าย ขอบคุณที่คุณเลือกจะช่วยเหลือแม้ในยามที่เขาเหล่านั้นไม่มีแรงจะร้องขอ',
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