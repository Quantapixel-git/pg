import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/auth_controller.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/controllers/user_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/widgets/admin_user_card.dart';
import 'package:pg/widgets/center_text.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/loader.dart';

class AdminUsersListScreen extends StatelessWidget {
  AdminUsersListScreen({super.key});

  final _pgController = Get.find<PgController>();
  final _authController = Get.find<AuthController>();
  final _floorController = Get.put(FloorController());
  final _roomController = Get.put(RoomController());
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
                  onSelected: (id) {
                    _userController.selectedPGIdForSearch = id;
                    _floorController.getALlFloorDropdownByPGId(id);
                  },
                  label: "Select PG",
                  items: _pgController.pgList,
                ),
                DropdownInput(
                  onSelected: (id) {
                    _userController.selectedFloorIdForSearch = id;
                    _roomController.getAllRoomsDropdownByFloorId(id);
                  },
                  label: "Select Floor",
                  items: _floorController.dropdownFloorList.value,
                ),
                DropdownInput(
                  onSelected: (id) {
                    _userController.selectedRoomIdForSearch = id;
                    _userController.getFilteredUsers();
                  },
                  label: "Select Room",
                  items: _roomController.dropdownRoomList.value,
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
                                adminRole:
                                    _authController.adminUser.value?.role,
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
                                  Get.toNamed(
                                    RouteName.adminEditUser,
                                    arguments: user,
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
