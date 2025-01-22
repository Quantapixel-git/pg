import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/screens/admin_banner_list_screen.dart';
import 'package:pg/screens/admin_booking_list_screen.dart';
import 'package:pg/screens/admin_floor_list_screen.dart';
import 'package:pg/screens/admin_pg_list_screen.dart';
import 'package:pg/screens/admin_room_list_screen.dart';
import 'package:pg/screens/admin_subadmin_list_screen.dart';
import 'package:pg/screens/admin_users_list_screen.dart';

class NavigationItem {
  final String title;
  final String? insertRouteName;
  final Widget widget;

  NavigationItem({
    required this.title,
    required this.insertRouteName,
    required this.widget,
  });
}

class DrawerNavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final navigationItems = [
    NavigationItem(
      title: "PG",
      insertRouteName: RouteName.adminAddPG,
      widget: AdminPgListScreen(),
    ),
    NavigationItem(
      title: "Floors",
      insertRouteName: RouteName.adminAddFloor,
      widget: AdminFloorListScreen(),
    ),
    NavigationItem(
      title: "Rooms",
      insertRouteName: RouteName.adminAddRoom,
      widget: AdminRoomListScreen(),
    ),
    NavigationItem(
      title: "Users",
      insertRouteName: RouteName.adminAddUser,
      widget: AdminUsersListScreen(),
    ),
    NavigationItem(
      title: "Banners",
      insertRouteName: RouteName.adminAddBanner,
      widget: AdminBannerListScreen(),
    ),
    NavigationItem(
      title: "Sub Admin",
      insertRouteName: RouteName.adminAddSubAdmin,
      widget: AdminSubadminListScreen(),
    ),
    NavigationItem(
      title: "Bookings",
      insertRouteName: null,
      widget: AdminBookingListScreen(),
    ),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
