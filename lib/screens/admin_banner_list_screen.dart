import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/banner_controller.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/widgets/loader.dart';

class AdminBannerListScreen extends StatelessWidget {
  AdminBannerListScreen({super.key});

  final _bannerController = Get.find<BannerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text("Banner's"),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteName.adminAddBanner);
            },
            child: Text(
              "Add",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => _bannerController.isLoading.value
            ? const Loader()
            : ListView.builder(
                itemCount: _bannerController.bannerList.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final banner = _bannerController.bannerList[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColors.black.withValues(alpha: 0.1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            child: Image.network(
                              banner.iamgeUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _bannerController.deleteBanner(
                                    bannerId: banner.id);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.danger,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(
                                  RouteName.adminUpdateBanner,
                                  arguments: banner,
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
