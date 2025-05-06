import 'package:flutter/material.dart';

class UserProfile with ChangeNotifier {
  String? fullName;
  String? age;
  String? gender;
  String? birthDate;
  String? phoneNumber;
  String? email;
  String? username;

  void updateProfile({
    String? fullName,
    String? age,
    String? gender,
    String? birthDate,
    String? phoneNumber,
    String? email,
    String? username,
  }) {
    this.fullName = fullName ?? this.fullName;
    this.age = age ?? this.age;
    this.gender = gender ?? this.gender;
    this.birthDate = birthDate ?? this.birthDate;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
    this.email = email ?? this.email;
    this.username = username ?? this.username;
    notifyListeners();
  }

  void setUserData({
    String? fullName,
    String? age,
    String? gender,
    String? birthDate,
    String? phoneNumber,
    String? email,
    String? username,
  }) {
    this.fullName = fullName ?? ''; // หรือ this.fullName ถ้าต้องการเก็บค่าเดิม
    this.age = age ?? '';
    this.gender = gender ?? '';
    this.birthDate = birthDate ?? '';
    this.phoneNumber = phoneNumber ?? '';
    this.email = email ?? '';
    this.username = username ?? '';
    notifyListeners();
  }
}