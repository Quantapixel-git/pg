import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/floor_model.dart';
import 'package:pg/services/floor_services.dart';

class CommonController extends GetxController {
  // States
  final isLoading = false.obs;
  final floorList = RxList<FloorModel>([]);

  final dropdownFloorList = RxList<FloorModel>([]);

  final isInserting = false.obs;
  final isUpdating = false.obs;

  // Input
  String? selectedPGId;
  final nameController = TextEditingController();

  void getAllFloorsByPGId({required String? pgId}) async {
    if (pgId == null) {
      AppUtils.showSnackBar(title: "Error", message: "Please seleect PG first");
      return;
    }

    isLoading.value = true;

    floorList.clear();

    final res = await FloorServices.getAllFloorsByPGId(pgId: pgId!);

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
}
