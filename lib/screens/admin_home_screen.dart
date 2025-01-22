import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/drawer_controller.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_home_card.dart';
import 'package:pg/widgets/drawer_items.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final _drawerNavigationController = Get.put(DrawerNavigationController());

  @override
  void initState() {
    // TODO: implement initState
    Get.put(PgController());
    Get.put(FloorController());
    Get.put(RoomController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedIndex = _drawerNavigationController.selectedIndex.value;
      final currentNavigationItem =
          _drawerNavigationController.navigationItems[selectedIndex];

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text(
            _drawerNavigationController.navigationItems[selectedIndex].title,
          ),
          actions: [
            if (currentNavigationItem.insertRouteName != null)
              TextButton(
                onPressed: () {
                  Get.toNamed(currentNavigationItem.insertRouteName!);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: AppColors.primary,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Admin ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              DrawerItems(
                onChanged: (index) {
                  Navigator.pop(context);
                  _drawerNavigationController.selectedIndex(index);
                },
                currentIndex: _drawerNavigationController.selectedIndex.value,
              ),
            ],
          ),
        ),
        body: _drawerNavigationController.navigationItems
            .elementAt(
              _drawerNavigationController.selectedIndex.value,
            )
            .widget,
      );
    });
  }
}
