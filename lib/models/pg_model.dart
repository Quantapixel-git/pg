import 'dart:io';

import 'package:get/get.dart';

class PGModel {
  final String? id;
  final String imageUrl;
  final String name;
  final String address;
  final File? selectedLocalImage;

  PGModel({
    this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    this.selectedLocalImage,
  });

  factory PGModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return PGModel(
      id: (json['id'] as int).toString(),
      imageUrl: json['image_url'],
      name: json['name'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "image": MultipartFile(selectedLocalImage, filename: "image"),
    };
  }
}
