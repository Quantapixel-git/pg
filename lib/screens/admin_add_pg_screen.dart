import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminAddPgScreen extends StatefulWidget {
  AdminAddPgScreen({super.key});

  @override
  State<AdminAddPgScreen> createState() => _AdminAddPgScreenState();
}

class _AdminAddPgScreenState extends State<AdminAddPgScreen> {
  final _pgController = Get.find<PgController>();

  @override
  void dispose() {
    // TODO: implement dispose
    _pgController.clearInputs();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text("Add PG"),
        ),
        body: Obx(
          () => _pgController.isInserting.value
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Input(
                          controller: _pgController.nameController,
                          label: "Name",
                        ),
                        Input(
                          controller: _pgController.addressController,
                          label: "Address",
                        ),
                        ImageField(
                          onTap: () async {
                            _pgController.pickAndUpdateImageState();
                          },
                          localImage: _pgController.selectedPGImage.value,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Button(
                          hasFullWidth: true,
                          text: "Add PG",
                          onTap: () {
                            _pgController.insertPG();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
