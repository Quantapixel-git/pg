import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/sub_admin_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/sub_admin_model.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminEditSubAdminScreen extends StatefulWidget {
  const AdminEditSubAdminScreen({super.key});

  @override
  State<AdminEditSubAdminScreen> createState() =>
      _AdminEditSubAdminScreenState();
}

class _AdminEditSubAdminScreenState extends State<AdminEditSubAdminScreen> {
  final subAdmin = Get.arguments as SubAdminModel;

  final _subAdminController = Get.find<SubAdminController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subAdminController.initInputStatesWithValue(subAdmin);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subAdminController.clearAllInputState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Edit Sub Admin"),
      ),
      body: Obx(
        () => _subAdminController.isUpdating.value
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
                      onTap: () {
                        _subAdminController.editSubAdmin(subAdmin.id);
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
