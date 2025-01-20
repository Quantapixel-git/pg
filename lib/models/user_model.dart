import 'dart:io';

import 'package:dio/dio.dart';

class UserModel {
  final String? userId;
  final String pgId;
  final String floorId;
  final String roomId;
  final String name;
  final String email;
  final String mobile;
  final String address;
  final String age;
  final String designation;
  final String aadharNumber;
  final String? aadhar;
  final DateTime? dateOfJoining;
  final DateTime? dateOfLeaving;

  UserModel({
    this.userId,
    required this.pgId,
    required this.floorId,
    required this.roomId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.age,
    required this.designation,
    required this.aadharNumber,
    required this.aadhar,
    required this.dateOfJoining,
    required this.dateOfLeaving,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return UserModel(
      userId: json['user_id'],
      pgId: json['category_id'],
      floorId: json['sub_category_id'],
      roomId: json['inner_sub_category_id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      address: json['address'],
      age: json['age'],
      designation: json['designation'],
      aadharNumber: json['aadhar_no'],
      aadhar: json['aadhar'],
      dateOfJoining: json['date_of_joining'] != null
          ? DateTime.parse(json['date_of_joining'])
          : null,
      dateOfLeaving: json['date_of_leaving'] != null
          ? DateTime.parse(json['date_of_leaving'])
          : null,
    );
  }

  Future<Map<String, dynamic>> toJson(
    bool isUpdating,
    File? aadharImage,
  ) async {
    final jsonData = {
      "category_id": pgId,
      "sub_category_id": floorId,
      "inner_sub_category_id": roomId,
      "name": name,
      "email": email,
      "mobile": mobile,
      "address": address,
      "age": age,
      "designation": designation,
      "aadhar_no": aadharNumber,
      "date_of_joining": dateOfJoining,
      "date_of_leaving": dateOfLeaving,
    };

    if (aadharImage != null) {
      jsonData['aadhar'] = await MultipartFile.fromFile(aadharImage.path);
    }

    if (isUpdating) {
      jsonData["user_id"] = userId!;
    }

    return jsonData;
  }
}
