import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/sub_admin_model.dart';
import 'package:pg/services/sub_admin_services.dart';

class SubAdminController extends GetxController {
  // States
  final isLoading = false.obs;
  final subAdminList = RxList<SubAdminModel>([]);
  final isInserting = false.obs;
  final isUpdating = false.obs;

  // Input
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    getAllSubAdmins();
    super.onReady();
  }

  void getAllSubAdmins() async {
    isLoading.value = true;

    subAdminList.clear();

    final res = await SubAdminServices.getAllSubAdmin();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        subAdminList.addAll(floorData);
      },
    );
    isLoading.value = false;
  }

  void insertSubAdmin() async {
    if (nameController.text.isEmpty ||
        mobileController.text.isEmpty ||
        passwordController.text.isEmpty ||
        cPasswordController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    if (passwordController.text != cPasswordController.text) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "Password Does not match",
      );
      return;
    }

    isInserting.value = true;

    final subAdmin = SubAdminModel(
      id: null,
      name: nameController.text.trim(),
      mobile: mobileController.text.trim(),
      role: "sub-admin",
    );

    final res = await SubAdminServices.insertSubAdmin(
      subAdmin: subAdmin,
      password: passwordController.text.trim(),
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Sub Admin Successfully Added",
          backgroundColor: Colors.green,
        );

        getAllSubAdmins();

        Get.until((route) => Get.currentRoute == RouteName.adminHome);
      },
    );
    isInserting.value = false;
  }

  void editSubAdmin(String? adminId) async {
    if (nameController.text.isEmpty ||
        mobileController.text.isEmpty ||
        passwordController.text.isEmpty ||
        cPasswordController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    if (passwordController.text != cPasswordController.text) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "Password Does not match",
      );
      return;
    }

    if (adminId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );

      return;
    }

    isUpdating.value = true;

    final subAdmin = SubAdminModel(
      id: adminId,
      name: nameController.text.trim(),
      mobile: mobileController.text.trim(),
      role: "sub-admin",
    );

    final res = await SubAdminServices.updateSubAdmin(
      subAdmin: subAdmin,
      password: passwordController.text.trim(),
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Sub Admin Successfully Updated",
          backgroundColor: Colors.green,
        );
      },
    );
    isUpdating.value = false;
    getAllSubAdmins();
    Get.until((route) => Get.currentRoute == RouteName.adminHome);
  }

  void deleteSubAdmin({
    required String? subAdminId,
  }) async {
    if (subAdminId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
      return;
    }

    final res = await SubAdminServices.deleteSubAdmin(subAdminId: subAdminId);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Sub Admin Successfully Delete",
          backgroundColor: Colors.green,
        );

        getAllSubAdmins();
      },
    );
  }

  void initInputStatesWithValue(SubAdminModel subAdmin) {
    nameController.text = subAdmin.name;
    mobileController.text = subAdmin.mobile;
  }

  void clearAllInputState() {
    nameController.clear();
    mobileController.clear();
    passwordController.clear();
    cPasswordController.clear();
  }
}
