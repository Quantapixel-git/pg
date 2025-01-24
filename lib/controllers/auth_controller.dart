import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/admin_model.dart';
import 'package:pg/models/user_model.dart';
import 'package:pg/services/auth_services.dart';

class AuthController extends GetxController {
  final adminUser = Rx<AdminModel?>(null);
  final user = Rx<UserModel?>(null);

  final isLoading = false.obs;

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  void adminLogin() async {
    if (mobileController.text.isEmpty || passwordController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Error ",
        message: "All Fields are required",
      );
      return;
    }

    isLoading.value = true;

    final res = await AuthServices.adminLogin(
      mobile: mobileController.text.trim(),
      password: passwordController.text.trim(),
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: "Error", message: failure.message);
      },
      (userData) {
        adminUser.value = userData;

        Get.offAllNamed(RouteName.adminHome);
      },
    );
    isLoading.value = false;
  }
}
