import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/floor_model.dart';

class FloorServices {
  static Future<Either<Failure, List<FloorModel>>> getAllFloors() async {
    try {
      final data = await Request.get(url: ApiEndpoints.getAllFloors);

      final floorList = (data['data'] as List)
          .map((floor) => FloorModel.fromJson(floor))
          .toList();

      return right(floorList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, List<FloorModel>>> getAllFloorsByPGId({
    required String pgId,
  }) async {
    try {
      final data = await Request.post(
        url: ApiEndpoints.getAllFloorsByPGId,
        body: {"category_id": pgId},
      );

      final floorList = (data['data'] as List)
          .map((floor) => FloorModel.fromJson(floor))
          .toList();

      return right(floorList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> insertFloor({
    required String pgId,
    required String floorName,
  }) async {
    try {
      final data = await Request.post(
        url: ApiEndpoints.insertFloor,
        body: {"category_id": pgId, "name": floorName},
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> deleteFloor({
    required String floorId,
  }) async {
    try {
      final data = await Request.post(
        url: ApiEndpoints.deleteFloor,
        body: {"subcategory_id": floorId},
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> updateFloor({
    required String pgId,
    required String floorId,
    required String floorName,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.updateFloor,
        body: {
          "category_id": pgId,
          "subcategory_id": floorId,
          "name": floorName,
        },
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
