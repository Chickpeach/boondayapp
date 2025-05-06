import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // สำหรับการกลับหน้า home หรืออื่น ๆ
import 'package:provider/provider.dart';
import '../providers/user_profile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังรูปภาพ
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
                    Navigator.pop(context); // กดแล้วกลับหน้าก่อนหน้า
                  },
                ),
              ),
            ),
          ),
          // เนื้อหาหน้า Register
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
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'ชื่อ - นามสกุล ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: Color(0xFFEC5A5A),
                                    fontSize: 15,
                                  ),
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
                          controller: _fullNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกชื่อ - นามสกุล';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'อายุ ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: Color(0xFFEC5A5A),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          controller: _ageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกอายุ';
                            }
                            final age = int.tryParse(value);
                            if (age == null || age <= 0) {
                              return 'กรุณากรอกอายุให้ถูกต้อง';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: 'เพศ ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: Color(0xFFEC5A5A),
                                    fontSize: 15,
                                  ),
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
                          controller: _genderController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกเพศ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
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
                                  fullName: _fullNameController.text,
                                  age: _ageController.text,
                                  gender: _genderController.text,
                                );
                                Navigator.pushNamed(context, AppRoutes.register2);
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