import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/user_booking_controller.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/input.dart';

class BookRoomScreen extends StatefulWidget {
  const BookRoomScreen({super.key});

  @override
  State<BookRoomScreen> createState() => _BookRoomScreenState();
}

class _BookRoomScreenState extends State<BookRoomScreen> {
  final _userBookingControoler = Get.find<UserBookingController>();

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
                controller: TextEditingController(
                  text: _userBookingControoler.selectedPGName,
                ),
                label: "PG Name",
                readOnly: true,
                enabled: false,
              ),
              Input(
                controller: TextEditingController(
                  text: _userBookingControoler.selectedFloorName,
                ),
                label: "Floor No",
                readOnly: true,
                enabled: false,
              ),
              Input(
                controller: TextEditingController(
                  text: _userBookingControoler.selectedRoomName,
                ),
                label: "Room No",
                readOnly: true,
                enabled: false,
              ),
              Input(
                controller: TextEditingController(
                  text: _userBookingControoler.selectedNoOfSharing.toString(),
                ),
                label: "No of Sharing",
                readOnly: true,
                enabled: false,
              ),
              Row(
                children: [
                  Expanded(
                    child: Input(
                      controller: _userBookingControoler.fNameController,
                      label: "First Name",
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Input(
                        controller: _userBookingControoler.lNameController,
                        label: "Last Name "),
                  ),
                ],
              ),
              Input(
                controller: _userBookingControoler.phoneController,
                label: "Phone Number",
              ),
              Input(
                controller: _userBookingControoler.addressController,
                label: "Address",
              ),
              SizedBox(
                height: 16.0,
              ),
              Button(
                hasFullWidth: true,
                text: "Submit",
                onTap: () {
                  _userBookingControoler.bookPG();
                },
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
