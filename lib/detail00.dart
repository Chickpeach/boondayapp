import 'package:flutter/material.dart';
import 'donate01.dart';

class DetailFoundation00 extends StatefulWidget {
  const DetailFoundation00({super.key});

  @override
  State<DetailFoundation00> createState() => _DetailFoundation00State();
}

class _DetailFoundation00State extends State<DetailFoundation00> {
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
                          "ศิริราชมูลนิธิ",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: Image.asset(
                          'assets/images/foundation1.png',
                          width: 400,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "รายละเอียศิริราชมูลนิธิ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "ชื่อภาษาอังกฤษ : SIRIRAJ FOUNDATION (S.F.)\n"
                              "ประเภทองค์กร : องค์กรไม่แสวงหาผลกำไร\n"
                              "วัตถุประสงค์ : เพื่อเป็นสะพานเชื่อมระหว่างผู้ให้และผู้รับ ในการสนับสนุนการรักษาพยาบาลสำหรับผู้ป่วยยากไร้ในโรงพยาบาลศิริราช \n"
                              "โรงพยาบาลแห่งแรกของประเทศไทยและศูนย์การแพทย์ชั้นนำระดับประเทศ ด้วยภารกิจหลักในการจัดซื้อเครื่องมือแพทย์ที่ทันสมัย สนับสนุนทุนการศึกษาแก่บุคลากรทางการแพทย์ และต่อชีวิตให้กับผู้ป่วยที่ขาดแคลน ศิริราชมูลนิธิจึงกลายเป็นที่พึ่งสุดท้ายของหลายชีวิตในทุกวัน บริจาควันนี้ คือการแบ่งเบาภาระให้โรงพยาบาล และต่อโอกาสให้ผู้ป่วยได้เข้าถึงการรักษาอย่างเท่าเทียม\n"
                              "สายด่วน : 024198053\n"
                              "เว็บไซต์ : https://www.sirirajfoundation.org/th/\n"
                              "ที่ตั้ง : ตึกมหิดลบำเพ็ญ ชั้น 1 เลขที่ 2โรงพยาบาลศิริราช",
                          style: TextStyle(fontSize: 14),
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
                                  foundationName: 'ศิริราชมูลนิธิ',
                                  foundationImage: 'foundation1.png',
                                  imagePath: 'donate1.png',
                                  accountName: 'ศิริราชมูลนิธิ',
                                  bankName: 'e-Donation',
                                  accountNumber: '099300039694491',
                                  thankYouTitle: 'ศิริราชมูลนิธิ',
                                  thankYouSubTitle: 'ขอบคุณจากหัวใจ ที่คุณเลือกเป็นพลังในการรักษา',
                                  thankYouBodyText:
                                  ' ขอบคุณที่ร่วมเป็นส่วนหนึ่งในการช่วยเหลือผู้ป่วยยากไร้และสนับสนุนการพัฒนาการแพทย์ของโรงพยาบาลศิริราช ทุกยอดบริจาคของคุณคือเส้นเลือดฝอยที่หล่อเลี้ยงร่างกายของระบบสาธารณสุขให้แข็งแรงขึ้น ขอบคุณที่มองเห็นคุณค่าของชีวิตของผู้ป่วยแม้คุณจะไม่รู้จักเขาโดยตรง ศิริราชมูลนิธิขอสัญญาว่า จะใช้ทุกบาทอย่างซื่อสัตย์ โปร่งใส และเต็มเปี่ยมด้วยหัวใจของผู้ให้',
                                ),
                              ),
                            ).then((_) {
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
                            child: const Text(
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
        icon: Image.asset('assets/icons/back.png', width: 35, height: 35),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/icons/cart.png', width: 28, height: 28),
          onPressed: () {
            Navigator.pushNamed(context, '/cart'); // แก้ตามชื่อ route จริงของคุณ
          },
        ),
      ],
    );
  }
}
