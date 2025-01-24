import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/input.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "User Login",
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
            label: "Email",
          ),
          Input(
            label: "Password",
          ),
          SizedBox(
            height: 16.0,
          ),
          Button(
            text: "Log In",
            onTap: () {
              Get.offAllNamed(RouteName.adminHome);
            },
            hasFullWidth: true,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.adminLogin);
            },
            child: Text(
              "Admin Login",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
