import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/pg_model.dart';

class PgServices {
  static Future<Either<Failure, List<PGModel>>> getAllPG() async {
    try {
      final data = await Request.get(url: ApiEndpoints.getAllPG);
      print("Pg List Getting starting .........");

      final pgList =
          (data['data'] as List).map((pg) => PGModel.fromJson(pg)).toList();

      print("Pg List Getting Success.....");
      print(pgList);
      return right(pgList);
    } on ServerException catch (e) {
      return left(Failure(title: e.status, message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> insertPG(
    PGModel pg,
    File image,
  ) async {
    try {
      await Request.post(
        url: ApiEndpoints.insertPG,
        isFormData: true,
        body: {
          "name": pg.name,
          "address": pg.address,
          "image": await MultipartFile.fromFile(
            image.path,
            filename: image.path.split("/").last,
          ),
        },
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: e.status, message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> updatePG(
    PGModel pg,
  ) async {
    try {
      final Map<String, dynamic> body = {
        "category_id": pg.id,
        "name": pg.name,
        "address": pg.address,
      };

      if (pg.selectedLocalImage != null) {
        body['image'] = await MultipartFile.fromFile(
          pg.selectedLocalImage!.path,
          filename: pg.selectedLocalImage!.path.split("/").last,
        );
      }

      await Request.post(
        url: ApiEndpoints.updatePG,
        isFormData: true,
        body: body,
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: e.status, message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> deletePG(
    int categoryId,
  ) async {
    try {
      await Request.post(
        url: ApiEndpoints.deletePG,
        body: {
          "category_id": categoryId,
        },
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: e.status, message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
