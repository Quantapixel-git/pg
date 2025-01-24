import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/room_model.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminEditRoomScreen extends StatefulWidget {
  const AdminEditRoomScreen({super.key});

  @override
  State<AdminEditRoomScreen> createState() => _AdminEditRoomScreenState();
}

class _AdminEditRoomScreenState extends State<AdminEditRoomScreen> {
  final room = Get.arguments as RoomModel;

  final _pgController = Get.find<PgController>();
  final _floorController = Get.find<FloorController>();
  final _roomController = Get.find<RoomController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _roomController.initAllInputWithValue(room);
      _floorController.selectedPGIdForSearch = room.floorId;
      _floorController.selectedPGIdForSearch = room.pgId;
      _floorController.getALlFloorDropdownByPGId(room.pgId);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _roomController.clearAllInputState();
      _floorController.dropdownFloorList.clear();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Edit Room"),
      ),
      body: Obx(
        () => _roomController.isUpdating.value
            ? const Loader()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownInput(
                        onSelected: (id) {
                          _roomController.selectedPGId = id;
                          _floorController.getALlFloorDropdownByPGId(id);
                        },
                        hintText: room.pgName ?? "",
                        label: "Select PG",
                        items: _pgController.pgList,
                      ),
                      DropdownInput(
                        onSelected: (id) {
                          _roomController.selectedFloorId = id;
                        },
                        hintText: room.name ?? "",
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
                        text: "Update Room",
                        onTap: () {
                          _roomController.editRoom(room.id);
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
