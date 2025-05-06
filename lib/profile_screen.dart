import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile.dart';
import '../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfile>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'บัญชีผู้ใช้',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // เพิ่มบรรทัดนี้
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 20),
            _buildProfileInfo('ชื่อผู้ใช้งาน', userProfile.username ?? '-'),
            _buildProfileInfo('ชื่อ-นามสกุล', userProfile.fullName ?? '-'),
            _buildProfileInfo('อายุ', '${userProfile.age ?? '-'} ปี'),
            _buildProfileInfo('เพศ', userProfile.gender ?? '-'),
            _buildProfileInfo('วันเกิด', userProfile.birthDate ?? '-'),
            _buildProfileInfo('เบอร์โทรศัพท์', userProfile.phoneNumber ?? '-'),
            _buildProfileInfo('อีเมล', userProfile.email ?? '-'),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF18C3A3),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.editProfile);
              },
              child: const Text(
                'แก้ไข',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
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
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(top: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}