import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminAddRoomScreen extends StatefulWidget {
  const AdminAddRoomScreen({super.key});

  @override
  State<AdminAddRoomScreen> createState() => _AdminAddRoomScreenState();
}

class _AdminAddRoomScreenState extends State<AdminAddRoomScreen> {
  final _pgController = Get.find<PgController>();
  final _floorController = Get.find<FloorController>();
  final _roomController = Get.find<RoomController>();

  @override
  void dispose() {
    // TODO: implement dispose
    _roomController.clearAllInputState();
    _floorController.dropdownFloorList.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Add Room"),
      ),
      body: Obx(
        () => _roomController.isInserting.value
            ? const Loader()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownInput(
                        onSelected: (id) {
                          _roomController.selectedPGId = id;
                          _floorController.getALlFloorDropdownByPGId();
                        },
                        label: "Select PG",
                        items: _pgController.pgList,
                      ),
                      DropdownInput(
                        onSelected: (id) {
                          _roomController.selectedFloorId = id;
                        },
                        label: "Select Floor",
                        items: _floorController.dropdownFloorList.value,
                      ),
                      Input(
                        controller: _roomController.nameController,
                        label: "Room Name",
                      ),
                      Input(
                        controller: _roomController.sharingController,
                        keyboardType: TextInputType.number,
                        label: "No of Sharing",
                      ),
                      Input(
                        controller: _roomController.priceController,
                        keyboardType: TextInputType.number,
                        label: "Price",
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Button(
                        hasFullWidth: true,
                        text: "Add Room",
                        onTap: _roomController.insertRoom,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
