import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/auth_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/widgets/admin_pg_card.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/loader.dart';

class AdminPgListScreen extends StatelessWidget {
  AdminPgListScreen({super.key});

  final _pgController = Get.find<PgController>();
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _pgController.isLoading.value
            ? const Loader()
            : _pgController.pgList.isEmpty
                ? CenterText(text: "No PG's Found")
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: _pgController.pgList.length,
                            itemBuilder: (context, index) {
                              final pg = _pgController.pgList[index];

                              return AdminPGCard(
                                adminRole:
                                    _authController.adminUser.value?.role,
                                onEditTap: (pg) {
                                  Get.toNamed(RouteName.adminEditPG,
                                      arguments: pg);
                                },
                                pg: pg,
                                onDeleteTap: (pgId) {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Text("Delete"),
                                      content: Text(
                                          "Are you sure you want to delete PG"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("No"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _pgController.deletePG(pgId: pgId);
                                            Get.back();
                                          },
                                          child: Text("Yes"),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
