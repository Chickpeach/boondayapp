import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // สำหรับการกลับหน้า home หรืออื่น ๆ
import 'package:provider/provider.dart';
import '../providers/user_profile.dart';
import 'main_screen.dart'; // Import MainScreen

class Register3Screen extends StatefulWidget {
  const Register3Screen({super.key});

  @override
  State<Register3Screen> createState() => _Register3ScreenState();
}

class _Register3ScreenState extends State<Register3Screen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกอีเมล';
                            }
                            if (!value.contains('@')) {
                              return 'รูปแบบอีเมลไม่ถูกต้อง';
                            }
                            return null;
                          },
                        ),

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
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกรหัสผ่าน';
                            }
                            if (value.length < 6) {
                              return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
                            }
                            return null;
                          },
                        ),

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
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณายืนยันรหัสผ่าน';
                            }
                            if (value != _passwordController.text) {
                              return 'รหัสผ่านไม่ตรงกัน';
                            }
                            return null;
                          },
                        ),

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
                              if (_formKey.currentState!.validate()) {
                                // เก็บข้อมูลทั้งหมดลงใน UserProfile Provider
                                Provider.of<UserProfile>(context, listen: false).setUserData(
                                  fullName: Provider.of<UserProfile>(context, listen: false).fullName!,
                                  age: Provider.of<UserProfile>(context, listen: false).age!,
                                  gender: Provider.of<UserProfile>(context, listen: false).gender!,
                                  birthDate: Provider.of<UserProfile>(context, listen: false).birthDate!,
                                  phoneNumber: Provider.of<UserProfile>(context, listen: false).phoneNumber!,
                                  email: _emailController.text,
                                  username: Provider.of<UserProfile>(context, listen: false).username!,
                                );
                                // นำทางไปยัง MainScreen โดยใช้ pushReplacement ร่วมกับ MaterialPageRoute
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MainScreen()),
                                );
                              }
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
          ),
        ],
      ),
    );
  }
}