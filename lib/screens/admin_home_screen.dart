import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_home_card.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.put(PgController());
    Get.put(FloorController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text("Admin"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          children: [
            AdminHomeCard(
              icon: FontAwesomeIcons.building,
              text: "PG's",
              onTap: () {
                Get.toNamed(RouteName.adminPGList);
              },
            ),
            AdminHomeCard(
              icon: FontAwesomeIcons.box,
              text: "Floors",
              onTap: () {
                Get.toNamed(RouteName.adminFloorList);
              },
            ),
            AdminHomeCard(
              icon: FontAwesomeIcons.restroom,
              text: "Rooms",
              onTap: () {
                Get.toNamed(RouteName.adminRoomList);
              },
            ),
            AdminHomeCard(
              icon: FontAwesomeIcons.user,
              text: "Users",
              onTap: () {
                Get.toNamed(RouteName.adminUsersList);
              },
            ),
            AdminHomeCard(
              icon: FontAwesomeIcons.image,
              text: "Banners",
              onTap: () {},
            ),
            AdminHomeCard(
              icon: Icons.admin_panel_settings_outlined,
              text: "Sub Admin",
              onTap: () {},
            ),
            AdminHomeCard(
              icon: Icons.book,
              text: "Bookings",
              onTap: () {},
            ),
          ],
        ));
  }
}
