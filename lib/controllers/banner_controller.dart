import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg/core/routes/route_name.dart';
import 'package:pg/core/utils/app_utils.dart';
import 'package:pg/core/utils/image_utils.dart';
import 'package:pg/models/banner_model.dart';
import 'package:pg/services/banner_services.dart';

class BannerController extends GetxController {
  // States
  final isLoading = false.obs;
  final bannerList = RxList<BannerModel>([]);
  final isInserting = false.obs;
  final isUpdating = false.obs;

  // Inputs
  final selectedLocalImage = Rx<File?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    getAllBanners();
    super.onInit();
  }

  void getAllBanners() async {
    isLoading.value = true;

    bannerList.clear();

    final res = await BannerServices.getAllBanners();

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (bannerData) {
        bannerList.addAll(bannerData);
      },
    );
    isLoading.value = false;
  }

  void insertBanner() async {
    if (selectedLocalImage.value == null) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "Banner Image is required",
      );
      return;
    }

    isInserting.value = true;

    final res = await BannerServices.insertBanner(
      bannerImage: selectedLocalImage.value!,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (data) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Banner Successfully Added",
          backgroundColor: Colors.green,
        );

        getAllBanners();

        Get.until((route) => Get.currentRoute == RouteName.adminHome);
      },
    );
    isInserting.value = false;
  }

  void editBanner(String? bannerId) async {
    if (bannerId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );

      return;
    }

    if (selectedLocalImage.value == null) {
      AppUtils.showSnackBar(
        title: "Validation Error",
        message: "Please Upload an image to update ",
      );

      return;
    }

    isUpdating.value = true;

    final banner = BannerModel(id: bannerId, iamgeUrl: "");

    final res = await BannerServices.updateBanner(
      banner: banner,
      bannerImage: selectedLocalImage.value!,
    );

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Banner Successfully Updated",
          backgroundColor: Colors.green,
        );

        getAllBanners();
        Get.until((route) => Get.currentRoute == RouteName.adminHome);
      },
    );
    isUpdating.value = false;
  }

  void deleteBanner({
    required String? bannerId,
  }) async {
    if (bannerId == null) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Something went wrong",
      );
      return;
    }

    final res = await BannerServices.deleteBanner(bannerId: bannerId);

    res.fold(
      (failure) {
        AppUtils.showSnackBar(title: failure.title, message: failure.message);
      },
      (floorData) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Floor Successfully Delete",
          backgroundColor: Colors.green,
        );

        getAllBanners();
      },
    );
  }

  void pickAndUpdateImageState() async {
    final image = await ImageUtils.pickImage(imageSource: ImageSource.gallery);

    selectedLocalImage.value = image;
  }

  void clearInputState() {
    selectedLocalImage.value = null;
  }
}
