import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Select your role ?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Button(
              hasFullWidth: true,
              text: "Admin",
              onTap: () {
                Get.offAllNamed(RouteName.adminHome);
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Button(
              hasFullWidth: true,
              text: "User",
              onTap: () {
                Get.offAllNamed(RouteName.userLayout);
              },
            ),
          ],
        ),
      ),
    );
  }
}
