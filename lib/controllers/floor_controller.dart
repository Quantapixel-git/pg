import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/floor_model.dart';
import 'package:pg/services/floor_services.dart';

class FloorController extends GetxController {
  // States
  final isLoading = false.obs;
  final floorList = RxList<FloorModel>([]);
  final isInserting = false.obs;
  final isUpdating = false.obs;

  // Input
  int? selectedPGId;
  final nameController = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    getAllFloors();
    super.onReady();
  }

  void getAllFloors() async {
    isLoading.value = true;

    floorList.clear();

    final res = await FloorServices.getAllFloors();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        floorList.addAll(floorData);
      },
    );
    isLoading.value = false;
  }

  void insertFloor() async {
    if (nameController.text.isEmpty || selectedPGId == null) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    isInserting.value = true;

    final res = await FloorServices.insertFloor(
      floorName: nameController.text.trim(),
      pgId: selectedPGId!,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Floor Successfully Added",
          backgroundColor: Colors.green,
        );

        getAllFloors();

        Get.until((route) => Get.currentRoute == RouteName.adminFloorList);
      },
    );
    isInserting.value = false;
  }

  void editFloor(int floorId) async {
    if (selectedPGId == null || nameController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );

      return;
    }

    isUpdating.value = true;

    final res = await FloorServices.editFloor(
      floorId: floorId,
      floorName: nameController.text.trim(),
      pgId: selectedPGId!,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Floor Successfully Updated",
        );
      },
    );
    isUpdating.value = false;
    getAllFloors();
    Get.until((route) => Get.currentRoute == RouteName.adminFloorList);
  }

  void deleteFloor({
    required int? floorId,
  }) async {
    if (floorId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
      return;
    }

    final res = await FloorServices.deleteFloor(floorId: floorId);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Floor Successfully Delete",
        );

        getAllFloors();
      },
    );
  }
}
