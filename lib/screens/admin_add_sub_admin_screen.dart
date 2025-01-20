import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg/controllers/floor_controller.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/controllers/room_controller.dart';
import 'package:pg/controllers/sub_admin_controller.dart';
import 'package:pg/controllers/user_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/core/utils/image_utils.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/dropdown_input.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminAddSubAdminScreen extends StatefulWidget {
  const AdminAddSubAdminScreen({super.key});

  @override
  State<AdminAddSubAdminScreen> createState() => _AdminAddSubAdminScreenState();
}

class _AdminAddSubAdminScreenState extends State<AdminAddSubAdminScreen> {
  final _subAdminController = Get.find<SubAdminController>();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _userController.clearAllInputStates();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Add Sub Admin"),
      ),
      body: Obx(
        () => _subAdminController.isInserting.value
            ? const Loader()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Input(
                      controller: _subAdminController.nameController,
                      label: "Name",
                    ),
                    Input(
                      controller: _subAdminController.mobileController,
                      keyboardType: TextInputType.emailAddress,
                      label: "Phone Number",
                    ),
                    Input(
                      controller: _subAdminController.passwordController,
                      isSecureEntry: true,
                      label: "Password",
                    ),
                    Input(
                      controller: _subAdminController.cPasswordController,
                      isSecureEntry: true,
                      label: "Confirm Password",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Button(
                      hasFullWidth: true,
                      text: "Add  Sub Admin",
                      onTap: _subAdminController.insertSubAdmin,
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
