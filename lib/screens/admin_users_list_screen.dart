import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_user_card.dart';
import 'package:pg/widgets/dropdown_input.dart';

class AdminUsersListScreen extends StatelessWidget {
  AdminUsersListScreen({super.key});

  final _pgController = Get.find<PgController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Users"),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteName.adminAddUser);
            },
            child: Text(
              "Add",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownInput(
                label: "Select PG",
                items: _pgController.pgList,
              ),
              DropdownInput(
                label: "Select Floor",
                items: _pgController.pgList,
              ),
              DropdownInput(
                label: "Select Room",
                items: _pgController.pgList,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AdminUserCard(
                    onEditTap: () {
                      Get.toNamed(RouteName.adminEditUser);
                    },
                    title: "Vishal Kumar",
                    pgName: "Unisex pg in delhi",
                    floorNumber: 5,
                    roomNumber: 14,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
