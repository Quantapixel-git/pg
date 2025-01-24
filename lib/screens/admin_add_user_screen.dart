import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/controllers/user_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/core/utils/image_utils.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminAddUserScreen extends StatefulWidget {
  const AdminAddUserScreen({super.key});

  @override
  State<AdminAddUserScreen> createState() => _AdminAddUserScreenState();
}

class _AdminAddUserScreenState extends State<AdminAddUserScreen> {
  File? selectedImage;

  final _pgController = Get.find<PgController>();
  final _floorController = Get.find<FloorController>();
  final _roomController = Get.find<RoomController>();
  final _userController = Get.find<UserController>();

  @override
  void dispose() {
    // TODO: implement dispose
    _userController.clearAllInputStates();
    super.dispose();
  }

  Future<DateTime?> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime(3000),
    );

    if (date != null) {
      return date;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Add User"),
      ),
      body: Obx(
        () => _userController.isInserting.value
            ? const Loader()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DropdownInput(
                      onSelected: (id) {
                        _userController.selectedPGId = id;
                        _floorController.getALlFloorDropdownByPGId(id);
                      },
                      label: "Select PG",
                      items: _pgController.pgList,
                    ),
                    DropdownInput(
                      onSelected: (id) {
                        _userController.selectedFloorId = id;
                        _roomController.selectedDropdownFloorId = id;
                        _roomController.getAllRoomsByFloorId();
                      },
                      label: "Select Floor",
                      items: _floorController.dropdownFloorList.value,
                    ),
                    DropdownInput(
                      onSelected: (id) {
                        _userController.selectedRoomId = id;
                      },
                      label: "Select Room",
                      items: _roomController.roomList.value,
                    ),
                    Input(
                      controller: _userController.nameController,
                      label: "Name",
                    ),
                    Input(
                      controller: _userController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                    ),
                    Input(
                      controller: _userController.mobileController,
                      keyboardType: TextInputType.phone,
                      label: "Phone Number",
                    ),
                    Input(
                      controller: _userController.addressController,
                      label: "Address",
                    ),
                    Input(
                      controller: _userController.ageController,
                      keyboardType: TextInputType.number,
                      label: "Age",
                    ),
                    Input(
                      controller: _userController.designationController,
                      label: "Designation",
                    ),
                    Input(
                      controller: _userController.adharNumberController,
                      keyboardType: TextInputType.number,
                      label: "Aadhar Number",
                    ),
                    ImageField(
                      label: "Upload AAdhar",
                      onTap: () async {
                        final image = await ImageUtils.pickImage(
                            imageSource: ImageSource.gallery);
                        _userController.selectedLocalAadharImage.value = image;
                      },
                      localImage:
                          _userController.selectedLocalAadharImage.value,
                    ),
                    Input(
                      controller: _userController.dateOfJoiningController,
                      onTap: () async {
                        final joiningDate = await _pickDate();
                        if (joiningDate != null) {
                          _userController.updateJoiningDateState(joiningDate);
                        }
                      },
                      readOnly: true,
                      label: "Date of Joining",
                    ),
                    Input(
                      controller: _userController.dateOfLeavingController,
                      onTap: () async {
                        final leavingDate = await _pickDate();
                        if (leavingDate != null) {
                          _userController.updateLeavingDateState(leavingDate);
                        }
                      },
                      readOnly: true,
                      label: "Date of Leaving",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Button(
                      hasFullWidth: true,
                      text: "Add User",
                      onTap: _userController.insertUser,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
