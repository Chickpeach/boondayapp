import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // สำหรับการกลับหน้า home หรืออื่น ๆ

class Register3Screen extends StatelessWidget {
  const Register3Screen({super.key});

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

                      // อีเมล
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'อีเมลล์ ',
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
                      _buildTextField(),

                      const SizedBox(height: 20),

                      // รหัสผ่าน
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'รหัสผ่าน ',
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
                      _buildTextField(),

                      const SizedBox(height: 20),

                      // ยืนยันรหัสผ่าน
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: 'ยืนยันรหัสผ่าน ',
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
                      _buildTextField(),

                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF68CBA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // กดปุ่มยืนยันทำอะไรต่อได้ที่นี่
                            Navigator.pushNamed(context, AppRoutes.history);
                          },
                          child: const Text(
                            'ยืนยัน',
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
        ],
      ),
    );
  }

  static Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
