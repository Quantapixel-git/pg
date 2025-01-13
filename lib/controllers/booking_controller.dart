import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/home_controller.dart';

class BookingController extends GetxController {
  final _homeController = Get.find<HomeController>();

  final pgController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final floorNoController = TextEditingController();
  final roomNoController = TextEditingController();
  final noOfSharingController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    pgController.text = _homeController.selectedPG!;
    floorNoController.text = _homeController.selectedFloorNumber!.toString();
    roomNoController.text = _homeController.selectedRoomNumber!.toString();
    noOfSharingController.text = _homeController.noOfSharing!.toString();

    super.onInit();
  }
}
