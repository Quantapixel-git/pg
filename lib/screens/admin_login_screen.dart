import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/auth_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _authController = Get.find<AuthController>();

  @override
  void dispose() {
    // TODO: implement dispose

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _authController.mobileController.clear();
        _authController.passwordController.clear();
      },
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter credentails to log in",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Input(
                controller: _authController.mobileController,
                label: "Email",
              ),
              Input(
                controller: _authController.passwordController,
                label: "Password",
              ),
              SizedBox(
                height: 16.0,
              ),
              Obx(() => _authController.isLoading.value
                  ? const Loader()
                  : Button(
                      text: "Log In",
                      onTap: _authController.adminLogin,
                      hasFullWidth: true,
                    ))
            ],
          ),
        ));
  }
}
