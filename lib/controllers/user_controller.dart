import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/core/utils/date_time_utils.dart';
import 'package:pg/models/user_model.dart';
import 'package:pg/services/user_services.dart';

class UserController extends GetxController {
  // States
  final isLoading = false.obs;
  final userList = RxList<UserModel>([]);
  final isInserting = false.obs;
  final isUpdating = false.obs;

  // Input
  String? selectedPGId;
  String? selectedFloorId;
  String? selectedRoomId;
  final selectedLocalAadharImage = Rx<File?>(null);
  DateTime? selectedDateOfJoining;
  DateTime? selectedDateOfLeaving;
  String? aadharImage;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final designationController = TextEditingController();
  final adharNumberController = TextEditingController();
  final dateOfJoiningController = TextEditingController();
  final dateOfLeavingController = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    getAllUsers();
    super.onReady();
  }

  void getAllUsers() async {
    isLoading.value = true;

    userList.clear();

    final res = await UserServices.getAllUsers();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (userData) {
        userList.addAll(userData);
      },
    );
    isLoading.value = false;
  }

  void insertUser() async {
    if (selectedFloorId == null ||
        selectedFloorId == null ||
        selectedRoomId == null ||
        nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        addressController.text.isEmpty ||
        ageController.text.isEmpty ||
        designationController.text.isEmpty ||
        adharNumberController.text.isEmpty ||
        selectedLocalAadharImage.value == null ||
        dateOfJoiningController.text.isEmpty ||
        dateOfLeavingController.text.isEmpty ||
        selectedDateOfJoining == null ||
        selectedDateOfLeaving == null) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    isInserting.value = true;

    final UserModel user = UserModel(
      pgId: selectedPGId!,
      floorId: selectedFloorId!,
      roomId: selectedRoomId!,
      name: nameController.text.trim(),
      email: emailController.text.tr,
      mobile: mobileController.text.trim(),
      address: addressController.text.trim(),
      age: ageController.text.trim(),
      designation: designationController.text.trim(),
      aadharNumber: adharNumberController.text.trim(),
      aadhar: null,
      dateOfJoining: selectedDateOfJoining!,
      dateOfLeaving: selectedDateOfLeaving!,
    );

    final res = await UserServices.insertUser(
      user: user,
      localAadharImage: selectedLocalAadharImage.value,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "User Successfully Added",
          backgroundColor: Colors.green,
        );

        getAllUsers();

        Get.until((route) => Get.currentRoute == RouteName.adminUsersList);
      },
    );
    isInserting.value = false;
  }

  void editUser(String? userId) async {
    if (userId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
      return;
    }

    if (selectedFloorId == null ||
        selectedFloorId == null ||
        selectedRoomId == null ||
        nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        addressController.text.isEmpty ||
        ageController.text.isEmpty ||
        designationController.text.isEmpty ||
        adharNumberController.text.isEmpty ||
        (selectedLocalAadharImage.value == null && aadharImage == null) ||
        dateOfJoiningController.text.isEmpty ||
        dateOfLeavingController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    isUpdating.value = true;

    final UserModel user = UserModel(
      userId: userId,
      pgId: selectedPGId!,
      floorId: selectedFloorId!,
      roomId: selectedRoomId!,
      name: nameController.text.trim(),
      email: emailController.text.tr,
      mobile: mobileController.text.trim(),
      address: addressController.text.trim(),
      age: ageController.text.trim(),
      designation: designationController.text.trim(),
      aadharNumber: adharNumberController.text.trim(),
      aadhar: null,
      dateOfJoining: selectedDateOfJoining!,
      dateOfLeaving: selectedDateOfLeaving!,
    );

    isUpdating.value = true;

    final res = await UserServices.updateUser(
      user: user,
      localAadharImage: selectedLocalAadharImage.value,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "User Successfully Updated",
          backgroundColor: Colors.green,
        );
      },
    );
    isUpdating.value = false;
    getAllUsers();
    Get.until((route) => Get.currentRoute == RouteName.adminUsersList);
  }

  void deleteUser({
    required String? userId,
  }) async {
    print("Delete Floor is calling .....");

    if (userId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
      return;
    }

    final res = await UserServices.deleteUser(userId: userId);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "User Successfully Delete",
          backgroundColor: Colors.green,
        );

        getAllUsers();
      },
    );
  }

  void initUserInputWithValues(UserModel user) {
    selectedPGId = user.pgId;
    selectedFloorId = user.floorId;
    selectedRoomId = user.roomId;
    aadharImage = user.aadhar;
    selectedDateOfJoining = user.dateOfJoining;
    selectedDateOfLeaving = user.dateOfLeaving;

    nameController.text = user.name;
    emailController.text = user.email;

    mobileController.text = user.mobile;
    addressController.text = user.address;
    ageController.text = user.age;
    designationController.text = user.designation;
    adharNumberController.text = user.aadharNumber;
    dateOfJoiningController.text =
        DateTimeUtils.formatDate(user.dateOfJoining!);
    dateOfLeavingController.text =
        DateTimeUtils.formatDate(user.dateOfLeaving!);
  }

  void updateJoiningDateState(DateTime date) {
    dateOfJoiningController.text = DateTimeUtils.formatDate(date);
    selectedDateOfJoining = date;
  }

  void updateLeavingDateState(DateTime date) {
    dateOfLeavingController.text = DateTimeUtils.formatDate(date);
    selectedDateOfLeaving = date;
  }

  void clearAllInputStates() {
    selectedPGId = null;
    selectedFloorId = null;
    selectedRoomId = null;
    aadharImage = null;
    selectedLocalAadharImage.value = null;
    selectedDateOfJoining = null;
    selectedDateOfLeaving = null;

    nameController.clear();
    emailController.clear();

    mobileController.clear();
    addressController.clear();
    ageController.clear();
    designationController.clear();
    adharNumberController.clear();
    dateOfJoiningController.clear();
    dateOfLeavingController.clear();
  }
}
