import 'package:get/get.dart';
import 'package:pg/models/pg_model.dart';

class HomeController extends GetxController {
  String? selectedPG;
  int noOfSharing = 0;
  int? selectedFloorNumber;
  int? selectedRoomNumber;

  final pgData = [
    PGModel(
      id: 1,
      imageUrl:
          "https://images.unsplash.com/photo-1455587734955-081b22074882?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "PG only for girls in New Delhi",
      address: "New Delhi",
    ),
    PGModel(
      id: 2,
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1661964402307-02267d1423f5?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "PG only for girls in New Yourk",
      address: "New Yourk",
    ),
    PGModel(
      id: 3,
      imageUrl:
          "https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "PG only for girls in Mumbai",
      address: "Mumbai",
    ),
    PGModel(
      id: 4,
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1661879252375-7c1db1932572?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "PG only for girls in Noida",
      address: "Noida",
    ),
  ];

  final bannerImages = [
    "https://images.unsplash.com/photo-1455587734955-081b22074882?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    'https://plus.unsplash.com/premium_photo-1661964402307-02267d1423f5?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1661879252375-7c1db1932572?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  void updatePGState(String pg) {
    selectedPG = pg;
  }

  void updateNoOfSharingState(int? num) {
    noOfSharing = num ?? 0;
  }

  void updateFloorState(int floorNumber) {
    selectedFloorNumber = floorNumber;
  }

  void updateRoomState(int roomNumber) {
    selectedRoomNumber = roomNumber;
  }
}
