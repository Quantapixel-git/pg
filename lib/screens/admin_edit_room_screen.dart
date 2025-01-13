import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/input.dart';

class AdminEditRoomScreen extends StatelessWidget {
  const AdminEditRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Edit Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Input(
                label: "Room Name",
              ),
              SizedBox(
                height: 16.0,
              ),
              Button(
                hasFullWidth: true,
                text: "Update Room",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
