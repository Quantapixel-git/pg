import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/models/room_model.dart';
import 'package:pg/services/room_services.dart';

class RoomController extends GetxController {
  // States
  final isLoading = false.obs;
  final isInserting = false.obs;
  final isUpdating = false.obs;

  final roomList = RxList<RoomModel>([]);
  final dropdownRoomList = RxList<RoomModel>([]);

  // Input
  String? selectedPGId;
  String? selectedFloorId;
  final nameController = TextEditingController();
  final sharingController = TextEditingController();
  final priceController = TextEditingController();

  String? selectedDropdownFloorId;

  @override
  void onReady() {
    // TODO: implement onReady
    // getallRooms();
    super.onReady();
  }

  void getallRooms() async {
    isLoading.value = true;

    roomList.value.clear();

    final res = await RoomServices.getAllRooms();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (roomData) {
        roomList.addAll(roomData);
      },
    );
    isLoading.value = false;
  }

  void insertRoom() async {
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        sharingController.text.isEmpty ||
        selectedPGId == null ||
        selectedFloorId == null) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "All fields are required",
      );
      return;
    }

    isInserting.value = true;

    final room = RoomModel(
      pgId: selectedPGId.toString(),
      floorId: selectedFloorId.toString(),
      name: nameController.text,
      sharing: sharingController.text.trim(),
      price: priceController.text.trim(),
    );

    final res = await RoomServices.insertRoom(
      room: room,
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

        roomList.clear();

        Get.until((route) => Get.currentRoute == RouteName.adminHome);
      },
    );
    isInserting.value = false;
  }

  void getAllRoomsByFloorId() async {
    if (selectedDropdownFloorId == null) {
      AppUtils.showSnackBar(title: "Error", message: "Please seleect PG first");
      return;
    }

    isLoading.value = true;

    roomList.clear();

    final res = await RoomServices.getAllRoomsByFloorId(
        floorId: selectedDropdownFloorId!);

    res.fold(
      (failure) {
        print("Failure was calling during rooms");
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (roomData) {
        roomList.addAll(roomData);
      },
    );
    isLoading.value = false;
  }

  void getAllRoomsDropdownByFloorId(String? floorId) async {
    if (floorId == null) {
      AppUtils.showSnackBar(title: "Error", message: "Please seleect PG first");
      return;
    }

    isLoading.value = true;

    dropdownRoomList.clear();

    final res = await RoomServices.getAllRoomsByFloorId(floorId: floorId);

    res.fold(
      (failure) {
        print("Failure was calling during rooms");
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (roomData) {
        dropdownRoomList.addAll(roomData);
      },
    );
    isLoading.value = false;
  }

  void editRoom(String? roomId) async {
    if (roomId == null) {
      AppUtils.showSnackBar(title: "Error", message: "No Room Id Found");

      return;
    }

    isUpdating.value = true;

    final room = RoomModel(
      id: roomId,
      pgId: selectedPGId.toString(),
      floorId: selectedFloorId.toString(),
      name: nameController.text,
      sharing: sharingController.text.trim(),
      price: priceController.text.trim(),
    );

    final res = await RoomServices.updateRoom(room: room);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Room Successfully Updated",
          backgroundColor: Colors.green,
        );

        getAllRoomsByFloorId();
        Get.until((route) => Get.currentRoute == RouteName.adminHome);
      },
    );
    isUpdating.value = false;
  }

  void deleteRoom({
    required String? roomId,
  }) async {
    if (roomId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
      return;
    }

    final res = await RoomServices.deleteRoom(roomId: roomId);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Room Successfully Delete",
          backgroundColor: Colors.green,
        );

        getAllRoomsByFloorId();
      },
    );
  }

  void initAllInputWithValue(RoomModel room) {
    selectedPGId = room.pgId;
    selectedFloorId = room.floorId;
    nameController.text = room.name;
    sharingController.text = room.sharing.toString();
    priceController.text = room.price.toString();
  }

  void clearAllInputState() {
    selectedPGId = null;
    selectedFloorId = null;
    nameController.clear();
    sharingController.clear();
    priceController.clear();
  }
}
