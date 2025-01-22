import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/admin_room_card.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/dropdown_input.dart';

class AdminRoomListScreen extends StatefulWidget {
  AdminRoomListScreen({super.key});

  @override
  State<AdminRoomListScreen> createState() => _AdminRoomListScreenState();
}

class _AdminRoomListScreenState extends State<AdminRoomListScreen> {
  final _pgController = Get.find<PgController>();

  final _floorController = Get.find<FloorController>();

  final _roomController = Get.find<RoomController>();

  @override
  void dispose() {
    // TODO: implement dispose
    if (mounted) {
      _floorController.dropdownFloorList.value.clear();
    }
    super.dispose();
  }

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
                  onSelected: (id) {
                    _floorController.selectedPGIdForSearch = id;
                    _floorController.getALlFloorDropdownByPGId();
                  },
                  label: "Select PG",
                  items: _pgController.pgList,
                ),
                DropdownInput(
                  onSelected: (id) {
                    print("Floor id is ...$id");
                    _roomController.getAllRoomsByFloorId(floorId: id);
                  },
                  label: "Select Floor",
                  items: _floorController.dropdownFloorList.value,
                ),
                _roomController.roomList.isEmpty
                    ? CenterText(text: "No Romms Found")
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _roomController.roomList.length,
                        itemBuilder: (context, index) {
                          final room = _roomController.roomList[index];
                          return AdminRoomCard(
                            room: room,
                            onDeleteTap: (roomId) {
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
                                        _roomController.deleteRoom(
                                            roomId: roomId);
                                        Get.back();
                                      },
                                      child: Text("Yes"),
                                    )
                                  ],
                                ),
                              );
                            },
                            onEditTap: (room) {
                              Get.toNamed(
                                RouteName.adminEditRoom,
                                arguments: room,
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
