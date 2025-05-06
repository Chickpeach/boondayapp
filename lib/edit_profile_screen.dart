import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userProfile = Provider.of<UserProfile>(context, listen: false);
    _fullNameController.text = userProfile.fullName ?? '';
    _ageController.text = userProfile.age ?? '';
    _genderController.text = userProfile.gender ?? '';
    _birthDateController.text = userProfile.birthDate ?? '';
    _phoneNumberController.text = userProfile.phoneNumber ?? '';
    _emailController.text = userProfile.email ?? '';
    _usernameController.text = userProfile.username ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'แก้ไขโปรไฟล์',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 60),
              ),
              const SizedBox(height: 20),
              _buildEditProfileInfo(
                'ชื่อผู้ใช้งาน',
                _usernameController,
              ),
              _buildEditProfileInfo(
                'ชื่อ-นามสกุล',
                _fullNameController,
              ),
              _buildEditProfileInfo(
                'อายุ',
                _ageController,
                keyboardType: TextInputType.number,
              ),
              _buildEditProfileInfo(
                'เพศ',
                _genderController,
              ),
              _buildEditProfileInfo(
                'วันเกิด',
                _birthDateController,
              ),
              _buildEditProfileInfo(
                'เบอร์โทรศัพท์',
                _phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
              _buildEditProfileInfo(
                'อีเมล',
                _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF18C3A3),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final userProfile = Provider.of<UserProfile>(context, listen: false);
                        userProfile.updateProfile(
                          fullName: _fullNameController.text,
                          age: _ageController.text,
                          gender: _genderController.text,
                          birthDate: _birthDateController.text,
                          phoneNumber: _phoneNumberController.text,
                          email: _emailController.text,
                          username: _usernameController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'บันทึก',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfileInfo(
      String label,
      TextEditingController controller, {
        TextInputType? keyboardType,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black54),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                keyboardType: keyboardType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}