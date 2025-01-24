import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/room_model.dart';

class RoomServices {
  static Future<Either<Failure, List<RoomModel>>> getAllRooms() async {
    try {
      final data = await Request.get(url: ApiEndpoints.getAllRooms);

      final floorList = (data['data'] as List)
          .map((floor) => RoomModel.fromJson(floor))
          .toList();

      return right(floorList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, List<RoomModel>>> getAllRoomsByFloorId({
    required String floorId,
  }) async {
    try {
      final data =
          await Request.post(url: ApiEndpoints.getAllRoomsByFloorId, body: {
        "sub_category_id": floorId,
      });

      final floorList = (data['data'] as List)
          .map((floor) => RoomModel.fromJson(floor))
          .toList();

      return right(floorList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> insertRoom({
    required RoomModel room,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.insertRoom,
        body: room.toJson(false),
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> deleteRoom({
    required String roomId,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.deleteRoom,
        body: {
          "inner_subcategory_id": roomId,
        },
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> updateRoom({
    required RoomModel room,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.updateRoom,
        body: room.toJson(true),
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
