import 'package:get/get.dart';
import 'package:pg/screens/admin_login_screen.dart';
import 'package:pg/screens/user_home_screen.dart';
import 'package:pg/screens/user_login_screen.dart';

class UserNavigationController extends GetxController {
  final currentIndex = 0.obs;

  final pages = [
    UserHomeScreen(),
    UserLoginScreen(),
  ];

  void updateNavigationIndex(int index) {
    currentIndex.value = index;
  }
}
