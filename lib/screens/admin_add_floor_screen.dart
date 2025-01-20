import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminAddFloorScreen extends StatefulWidget {
  const AdminAddFloorScreen({super.key});

  @override
  State<AdminAddFloorScreen> createState() => _AdminAddFloorScreenState();
}

class _AdminAddFloorScreenState extends State<AdminAddFloorScreen> {
  final _pgController = Get.find<PgController>();

  final _floorController = Get.find<FloorController>();

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
          title: Text("Add Floor"),
        ),
        body: Obx(
          () => _floorController.isInserting.value
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DropdownInput(
                          label: "Select PG",
                          hintText: "Select PG",
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
                          text: "Add Floor",
                          onTap: _floorController.insertFloor,
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
