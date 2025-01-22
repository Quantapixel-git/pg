import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_floor_card.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/loader.dart';

class AdminFloorListScreen extends StatefulWidget {
  const AdminFloorListScreen({super.key});

  @override
  State<AdminFloorListScreen> createState() => _AdminFloorListScreenState();
}

class _AdminFloorListScreenState extends State<AdminFloorListScreen> {
  final _pgController = Get.find<PgController>();

  final _floorController = Get.find<FloorController>();

  @override
  void dispose() {
    // TODO: implement dispose
    _floorController.selectedPGIdForSearch = null;
    _floorController.floorList.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _floorController.isLoading.value
            ? const Loader()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownInput(
                        onSelected: (id) {
                          _floorController.selectedPGIdForSearch = id;
                          _floorController.getAllFloorsByPGId();
                        },
                        label: "Select PG",
                        items: _pgController.pgList,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _floorController.floorList.length,
                        itemBuilder: (context, index) {
                          final floor = _floorController.floorList[index];

                          return AdminFloorCard(
                            floor: floor,
                            onEditTap: (floor) {
                              Get.toNamed(RouteName.adminEditFloor,
                                  arguments: floor);
                            },
                            onDeleteTap: (floorId) {
                              Get.dialog(
                                AlertDialog(
                                  title: Text("Delete"),
                                  content: Text(
                                      "Are you sure you want to delete Floor"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("No"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _floorController.deleteFloor(
                                            floorId: floorId);
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
