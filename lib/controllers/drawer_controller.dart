import 'package:get/get.dart';
import 'package:pg/core/enums/drawer_item_selection_enum.dart';
import 'package:pg/screens/admin_banner_list_screen.dart';
import 'package:pg/screens/admin_floor_list_screen.dart';
import 'package:pg/screens/admin_pg_list_screen.dart';
import 'package:pg/screens/admin_room_list_screen.dart';
import 'package:pg/screens/admin_subadmin_list_screen.dart';
import 'package:pg/screens/admin_users_list_screen.dart';

class DrawerNavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final screens = [
    AdminPgListScreen(),
    AdminFloorListScreen(),
    AdminRoomListScreen(),
    AdminUsersListScreen(),
    AdminBannerListScreen(),
    AdminSubadminListScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
