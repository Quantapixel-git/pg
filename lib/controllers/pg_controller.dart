import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/core/utils/image_utils.dart';
import 'package:pg/models/pg_model.dart';
import 'package:pg/services/pg_services.dart';

class PgController extends GetxController {
  // States
  final isLoading = false.obs;
  final pgList = RxList<PGModel>([]);
  final isInserting = false.obs;
  final isUpdating = false.obs;

  // Input
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final selectedPGImage = Rx<File?>(null);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getAllPG();
  }

  void pickAndUpdateImageState() async {
    final image = await ImageUtils.pickImage(imageSource: ImageSource.gallery);

    selectedPGImage.value = image;
  }

  void updateImageState(File? file) async {
    selectedPGImage.value = file;
  }

  void getAllPG() async {
    isLoading.value = true;

    final res = await PgServices.getAllPG();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        pgList.value = data;
        print(data);
      },
    );
    isLoading.value = false;
  }

  void insertPG() async {
    isInserting.value = true;

    if (selectedPGImage.value == null ||
        nameController.text.isEmpty ||
        addressController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    final pg = PGModel(
      name: nameController.text,
      address: addressController.text,
      selectedLocalImage: selectedPGImage.value,
      imageUrl: "",
    );

    final res = await PgServices.insertPG(pg, selectedPGImage.value!);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "PG Successfully Added",
          backgroundColor: Colors.green,
        );
        getAllPG();
        Get.until((route) => Get.currentRoute == RouteName.adminPGList);
      },
    );
    isInserting.value = false;
  }

  void updatePG(String pgId) async {
    isUpdating.value = true;

    final pg = PGModel(
      id: pgId,
      name: nameController.text,
      address: addressController.text,
      selectedLocalImage: selectedPGImage.value,
      imageUrl: "",
    );

    final res = await PgServices.updatePG(
      pg,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "PG Successfully Updated",
          backgroundColor: Colors.green,
        );
        getAllPG();
        Get.until((route) => Get.currentRoute == RouteName.adminPGList);
      },
    );
    isUpdating.value = false;
  }

  void deletePG({required String pgId}) async {
    isLoading.value = true;

    final res = await PgServices.deletePG(pgId);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        getAllPG();
      },
    );
  }
}
