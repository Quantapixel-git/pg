import 'package:get/get.dart';
import 'package:pg/screens/settings_screen.dart';
import 'package:pg/screens/user_home_screen.dart';

class UserNavigationController extends GetxController {
  final currentIndex = 0.obs;

  final pages = [
    UserHomeScreen(),
    SettingsScreen(),
  ];

  void updateNavigationIndex(int index) {
    currentIndex.value = index;
  }
}
