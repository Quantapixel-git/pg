import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/banner_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/loader.dart';

class AdminAddBannerScreen extends StatefulWidget {
  const AdminAddBannerScreen({super.key});

  @override
  State<AdminAddBannerScreen> createState() => _AdminAddBannerScreenState();
}

class _AdminAddBannerScreenState extends State<AdminAddBannerScreen> {
  final _bannerController = Get.find<BannerController>();

  @override
  void dispose() {
    // TODO: implement dispose
    _bannerController.clearInputState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          title: Text("Add Banner"),
        ),
        body: Obx(
          () => _bannerController.isInserting.value
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageField(
                          onTap: _bannerController.pickAndUpdateImageState,
                          localImage:
                              _bannerController.selectedLocalImage.value,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Button(
                          hasFullWidth: true,
                          text: "Add Floor",
                          onTap: _bannerController.insertBanner,
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
