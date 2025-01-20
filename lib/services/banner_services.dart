import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/banner_model.dart';

class BannerServices {
  static Future<Either<Failure, List<BannerModel>>> getAllBanners() async {
    try {
      final data = await Request.get(url: ApiEndpoints.getAllBanners);

      final bannerList = (data['data'] as List)
          .map((banner) => BannerModel.fromJson(banner))
          .toList();

      return right(bannerList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> insertBanner({
    required File bannerImage,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.insertBanner,
        body: {"image": await MultipartFile.fromFile(bannerImage.path)},
        isFormData: true,
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> deleteBanner({
    required String bannerId,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.deleteBanner,
        body: {"id": bannerId},
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> updateBanner({
    required BannerModel banner,
    required File bannerImage,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.updateBanner,
        body: await banner.toJson(true, bannerImage),
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
