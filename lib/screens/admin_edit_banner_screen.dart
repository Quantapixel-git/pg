import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/banner_controller.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/banner_model.dart';
import 'package:pg/widgets/button.dart';
import 'package:pg/widgets/image_field.dart';
import 'package:pg/widgets/loader.dart';

class AdminEditBannerScreen extends StatefulWidget {
  const AdminEditBannerScreen({super.key});

  @override
  State<AdminEditBannerScreen> createState() => _AdminEditBannerScreenState();
}

class _AdminEditBannerScreenState extends State<AdminEditBannerScreen> {
  final banner = Get.arguments as BannerModel;

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
          title: Text("Edit Banner"),
        ),
        body: Obx(
          () => _bannerController.isUpdating.value
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageField(
                          onTap: _bannerController.pickAndUpdateImageState,
                          imageUrl: banner.iamgeUrl,
                          localImage:
                              _bannerController.selectedLocalImage.value,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Button(
                          hasFullWidth: true,
                          text: "Add Floor",
                          onTap: () {
                            _bannerController.editBanner(banner.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
