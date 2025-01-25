import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/user_booking_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/loader.dart';

class UserAvailableRoomsScreen extends StatefulWidget {
  const UserAvailableRoomsScreen({super.key});

  @override
  State<UserAvailableRoomsScreen> createState() =>
      _UserAvailableRoomsScreenState();
}

class _UserAvailableRoomsScreenState extends State<UserAvailableRoomsScreen> {
  final _userBookingControoler = Get.find<UserBookingController>();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userBookingControoler.getAvailableRoomsWithFloors();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_userBookingControoler.selectedPGName ?? "Available Rooms"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    _userBookingControoler.selectedPGImageUrl ??
                        "https://plus.unsplash.com/premium_photo-1661964402307-02267d1423f5?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => _userBookingControoler.isLoading.value
                    ? const Loader()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            _userBookingControoler.roomsWithFloorList.length,
                        itemBuilder: (context, floorIndex) {
                          final roomWithFloor = _userBookingControoler
                              .roomsWithFloorList[floorIndex];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Floor ${roomWithFloor.floorName}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "See All",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueAccent,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: roomWithFloor.rooms.length,
                                  itemBuilder: (context, roomIndex) {
                                    final room = roomWithFloor.rooms[roomIndex];

                                    return GestureDetector(
                                      onTap: () {
                                        _userBookingControoler.updateFloorState(
                                            roomWithFloor.floorId,
                                            roomWithFloor.floorName);
                                        _userBookingControoler.updateRoomState(
                                          room.id,
                                          room.name,
                                        );

                                        Get.toNamed(RouteName.bookRoom);
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        margin: EdgeInsets.only(right: 8.0),
                                        decoration: BoxDecoration(
                                          color: AppColors.black
                                              .withValues(alpha: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            room.name.toString(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
