import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/auth_controller.dart';
import 'package:pg/controllers/sub_admin_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/widgets/admin_sub_admin_card.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/loader.dart';

class AdminSubadminListScreen extends StatelessWidget {
  AdminSubadminListScreen({super.key});

  final _subAdminController = Get.put(SubAdminController());
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _subAdminController.isLoading.value
                    ? const Loader()
                    : _subAdminController.subAdminList.isEmpty
                        ? CenterText(text: "No Sub Admin Found")
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _subAdminController.subAdminList.length,
                            itemBuilder: (context, index) {
                              final subAdmin =
                                  _subAdminController.subAdminList[index];

                              return AdminSubAdminCard(
                                adminRole:
                                    _authController.adminUser.value?.role,
                                onDeleteTap: (subAdminId) {
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
                                            _subAdminController.deleteSubAdmin(
                                              subAdminId: subAdminId,
                                            );
                                            Get.back();
                                          },
                                          child: Text("Yes"),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                subAdmin: subAdmin,
                                onEditTap: (subAdmin) {
                                  Get.toNamed(
                                    RouteName.adminUpdateSubAdmin,
                                    arguments: subAdmin,
                                  );
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
