import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/booking_controller.dart';
import 'package:pg/controllers/home_controller.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/input.dart';

class BookRoomScreen extends StatelessWidget {
  BookRoomScreen({super.key});

  final _bookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Input(
                controller: _bookingController.pgController,
                label: "PG Name",
                readOnly: true,
                enabled: false,
              ),
              Input(
                controller: _bookingController.floorNoController,
                label: "Floor No",
                readOnly: true,
                enabled: false,
              ),
              Input(
                controller: _bookingController.roomNoController,
                label: "Room No",
                readOnly: true,
                enabled: false,
              ),
              Input(
                controller: _bookingController.noOfSharingController,
                label: "No of Sharing",
                readOnly: true,
                enabled: false,
              ),
              Row(
                children: [
                  Expanded(
                    child: Input(label: "First Name"),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Input(label: "Last Name "),
                  ),
                ],
              ),
              Input(
                controller: _bookingController.phoneController,
                label: "Phone Number",
                readOnly: true,
              ),
              Input(
                controller: _bookingController.addressController,
                label: "Address",
                readOnly: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              Button(
                hasFullWidth: true,
                text: "Submit",
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
