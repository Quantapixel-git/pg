import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_pg_card.dart';
import 'package:pg/widgets/loader.dart';
import 'package:pg/widgets/search_input.dart';

class AdminPgListScreen extends StatelessWidget {
  AdminPgListScreen({super.key});

  final _pgController = Get.find<PgController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("PG's"),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteName.adminAddPG);
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SearchInput(
                onSumbited: (value) {},
                hintText: "Search PG",
              )),
        ),
      ),
      body: Obx(
        () => _pgController.isLoading.value
            ? const Loader()
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
                            onEditTap: (pg) {
                              Get.toNamed(RouteName.adminEditPG, arguments: pg);
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
