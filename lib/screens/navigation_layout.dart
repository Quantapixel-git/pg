import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/user_navigation_controller.dart';
import 'package:pg/core/theme/app_colors.dart';

class NavigationLayout extends StatelessWidget {
  NavigationLayout({super.key});

  final _navigationServices = Get.put(UserNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _navigationServices.pages
            .elementAt(_navigationServices.currentIndex.value),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _navigationServices.currentIndex.value,
          onDestinationSelected: _navigationServices.updateNavigationIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: _navigationServices.currentIndex.value == 0
                    ? AppColors.white
                    : AppColors.gray,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.login_outlined,
                color: _navigationServices.currentIndex.value == 1
                    ? AppColors.white
                    : AppColors.gray,
              ),
              label: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
