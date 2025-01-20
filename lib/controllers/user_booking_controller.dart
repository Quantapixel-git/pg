import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/booking_model.dart';
import 'package:pg/models/room_with_floor_model.dart';
import 'package:pg/services/booking_services.dart';

class UserBookingController extends GetxController {
  final isLoading = false.obs;
  final isInserting = false.obs;

  final roomsWithFloorList = <RoomWithFloorModel>[].obs;

  String? selectedPGId;
  String? selectedPGName;
  int selectedNoOfSharing = 0;
  String? selectedFloorId;
  String? selectedFloorName;
  String? selectedRoomId;
  String? selectedRoomName;
  final numberOfSharingDropdown = RxList<int>([]);

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  void getMaxNumOfSharingDropdown() async {
    if (selectedPGId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Please select a PG First",
      );
      return;
    }

    numberOfSharingDropdown.clear();

    final res = await BookingServices.getMaxNumberOfSharing(
      pgId: selectedPGId!,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(
          title: failure.title,
          message: failure.message,
        );
        return;
      },
      (sharing) {
        for (int i = 1; i <= int.parse(sharing); i++) {
          numberOfSharingDropdown.add(i);
        }
      },
    );
  }

  void getAvailableRoomsWithFloors() async {
    if (selectedPGId == null || selectedNoOfSharing == 0) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Please select a PG First and Number of Sharing first ",
      );
      return;
    }

    roomsWithFloorList.clear();
    isLoading.value = true;

    final res = await BookingServices.getAvailableRoomsWithFloor(
      pgId: selectedPGId!,
      numberOfSharing: selectedNoOfSharing.toString(),
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(
          title: failure.title,
          message: failure.message,
        );
        return;
      },
      (roomsWithFloor) {
        roomsWithFloorList.value = roomsWithFloor;
      },
    );
    isLoading.value = false;
  }

  void updatePGState(String? pgId, String pgName) {
    selectedPGId = pgId;
    selectedPGName = pgName;
  }

  void updateNoOfSharingState(int? num) {
    selectedNoOfSharing = num ?? 0;
  }

  void updateFloorState(String floorId, String floorName) {
    selectedFloorId = floorId;
    selectedFloorName = floorName;
  }

  void updateRoomState(String roomId, String roomName) {
    selectedRoomId = roomId;
    selectedRoomName = roomName;
  }

  void bookPG() async {
    if (selectedFloorId == null ||
        selectedFloorId == null ||
        selectedRoomId == null ||
        fNameController.text.isEmpty ||
        lNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All Fields are required",
      );
      return;
    }

    if (phoneController.text.length != 10) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "Mobile Number must be 10 digits",
      );
      return;
    }

    final booking = BookingModel(
      pgId: selectedPGId,
      floorId: selectedFloorId,
      roomId: selectedRoomId,
      customerName:
          "${fNameController.text.trim()} ${lNameController.text.trim()}",
      customerMobile: phoneController.text.trim(),
      customerAddress: addressController.text,
    );

    isInserting.value = true;

    final res = await BookingServices.bookPG(
      booking: booking,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(
          title: failure.title,
          message: failure.message,
        );
        return;
      },
      (roomsWithFloor) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Room Successfully Booked",
          backgroundColor: Colors.green,
        );

        Get.offAllNamed(RouteName.userLayout);
      },
    );
    isInserting.value = false;
  }
}
