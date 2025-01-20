import 'dart:io';

import 'package:dio/dio.dart';

class BannerModel {
  final String? id;
  final String iamgeUrl;

  BannerModel({
    required this.id,
    required this.iamgeUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: (json['id'] as int).toString(),
      iamgeUrl: json['image_url'],
    );
  }

  Future<Map<String, dynamic>> toJson(bool isUpdating, File image) async {
    final Map<String, dynamic> body = {
      "image": await MultipartFile.fromFile(image.path),
    };

    if (isUpdating) {
      body['id'] = id!;
    }

    return body;
  }
}
