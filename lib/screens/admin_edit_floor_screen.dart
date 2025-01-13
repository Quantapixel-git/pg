import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/floor_model.dart';
import 'package:pg/models/pg_model.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminEditFloorScreen extends StatefulWidget {
  AdminEditFloorScreen({super.key});

  @override
  State<AdminEditFloorScreen> createState() => _AdminEditFloorScreenState();
}

class _AdminEditFloorScreenState extends State<AdminEditFloorScreen> {
  final currentFloorData = Get.arguments as FloorModel;

  final _pgController = Get.find<PgController>();

  final _floorController = Get.find<FloorController>();

  @override
  void initState() {
    // TODO: implement initState
    _floorController.selectedPGId = currentFloorData.id;
    _floorController.nameController.text = currentFloorData.name;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _floorController.nameController.clear();
    _floorController.selectedPGId = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text("Edit Floor"),
        ),
        body: Obx(
          () => _floorController.isUpdating.value
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DropdownInput(
                          label: "Select PG",
                          hintText: currentFloorData.pgName,
                          items: _pgController.pgList,
                          onSelected: (id) {
                            _floorController.selectedPGId = id;
                          },
                        ),
                        Input(
                          controller: _floorController.nameController,
                          label: "Floor Name",
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Button(
                          hasFullWidth: true,
                          text: "Update Floor",
                          onTap: () {
                            _floorController.editFloor(
                              currentFloorData.id!,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
