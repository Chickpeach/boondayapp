import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // สำหรับการกลับหน้า home หรืออื่น ๆ
import 'package:provider/provider.dart';
import '../providers/user_profile.dart';

class Register2Screen extends StatefulWidget {
  const Register2Screen({super.key});

  @override
  State<Register2Screen> createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  final _formKey = GlobalKey<FormState>();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลัง
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // ปุ่มย้อนกลับ
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/back_button.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          // เนื้อหา
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'ลงทะเบียน',
                          style: TextStyle(
                            color: Color(0xFF2E8B58),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // วัน/เดือน/ปีเกิด
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'วัน/เดือน/ปี เกิด ',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Color(0xFFEC5A5A)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          controller: _birthDateController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกวัน/เดือน/ปี เกิด';
                            }
                            // เพิ่มการตรวจสอบรูปแบบวันที่เพิ่มเติมได้ถ้าต้องการ
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // เบอร์โทรศัพท์
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'เบอร์โทรศัพท์ ',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Color(0xFFEC5A5A)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกเบอร์โทรศัพท์';
                            }
                            // เพิ่มการตรวจสอบรูปแบบเบอร์โทรศัพท์เพิ่มเติมได้ถ้าต้องการ
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // ชื่อผู้ใช้งาน
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'ชื่อผู้ใช้งาน ',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Color(0xFFEC5A5A)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกชื่อผู้ใช้งาน';
                            }
                            // เพิ่มการตรวจสอบความซ้ำซ้อนของชื่อผู้ใช้งานได้ถ้าต้องการ
                            return null;
                          },
                        ),

                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Color(0xFFF68CBA), width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // เก็บข้อมูลลงใน UserProfile Provider
                                Provider.of<UserProfile>(context, listen: false).updateProfile(
                                  birthDate: _birthDateController.text,
                                  phoneNumber: _phoneNumberController.text,
                                  username: _usernameController.text,
                                );
                                Navigator.pushNamed(context, AppRoutes.register3);
                              }
                            },
                            child: const Text(
                              'ถัดไป',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}