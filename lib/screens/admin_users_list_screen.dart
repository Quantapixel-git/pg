import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/user_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_user_card.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/loader.dart';

class AdminUsersListScreen extends StatelessWidget {
  AdminUsersListScreen({super.key});

  final _pgController = Get.find<PgController>();
  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
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
                _userController.isLoading.value
                    ? const Loader()
                    : _userController.userList.isEmpty
                        ? CenterText(text: "No Users Found")
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _userController.userList.length,
                            itemBuilder: (context, index) {
                              final user = _userController.userList[index];

                              return AdminUserCard(
                                onDeleteTap: (userId) {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Text("Delete"),
                                      content: Text(
                                          "Are you sure you want to delete Room"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("No"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _userController.deleteUser(
                                              userId: userId,
                                            );
                                            Get.back();
                                          },
                                          child: Text("Yes"),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                user: user,
                                onEditTap: (user) {
                                  Get.toNamed(RouteName.adminEditUser,
                                      arguments: user);
                                },
                              );
                            },
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
