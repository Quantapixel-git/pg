import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg/controllers/pg_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/core/utils/image_utils.dart';
import 'package:pg/models/pg_model.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/input.dart';
import 'package:pg/widgets/loader.dart';

class AdminEditPgScreen extends StatefulWidget {
  const AdminEditPgScreen({super.key});

  @override
  State<AdminEditPgScreen> createState() => _AdminEditPgScreenState();
}

class _AdminEditPgScreenState extends State<AdminEditPgScreen> {
  final _pgController = Get.find<PgController>();

  final pg = Get.arguments as PGModel;

  @override
  void initState() {
    // TODO: implement initState
    _pgController.nameController.text = pg.name;
    _pgController.addressController.text = pg.address;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pgController.nameController.clear();
    _pgController.addressController.clear();
    _pgController.updateImageState(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text("Edit PG"),
        ),
        body: Obx(
          () => _pgController.isUpdating.value
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
                        Obx(
                          () => ImageField(
                            onTap: _pgController.pickAndUpdateImageState,
                            imageUrl: pg.imageUrl,
                            localImage: _pgController.selectedPGImage.value,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Button(
                          hasFullWidth: true,
                          text: "Update PG",
                          onTap: () {
                            _pgController.updatePG(pg.id!);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
