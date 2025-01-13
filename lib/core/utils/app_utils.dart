import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppUtils {
  static void showSnackBar({
    required String title,
    required String message,
    Color backgroundColor = Colors.redAccent,
    Color forgoundColor = Colors.white,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: forgoundColor,
    );
  }
}
