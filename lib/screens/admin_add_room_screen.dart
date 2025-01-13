import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/input.dart';

class AdminAddRoomScreen extends StatelessWidget {
  AdminAddRoomScreen({super.key});

  final _pgController = Get.find<PgController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Add Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownInput(
                label: "Select PG",
                items: _pgController.pgList,
              ),
              DropdownInput(
                label: "Select Floor",
                items: _pgController.pgList,
              ),
              Input(
                label: "Room Name",
              ),
              SizedBox(
                height: 16.0,
              ),
              Button(
                hasFullWidth: true,
                text: "Add Room",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
