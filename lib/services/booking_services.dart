import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/booking_model.dart';
import 'package:pg/models/room_with_floor_model.dart';

class BookingServices {
  static Future<Either<Failure, List<BookingModel>>> getAllBookings() async {
    try {
      final data = await Request.get(
        url: ApiEndpoints.getAllBookings,
      );

      final bookings = (data['data'] as List)
          .map(
            (e) => BookingModel.fromJson(e),
          )
          .toList();
      return right(bookings);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, String>> getMaxNumberOfSharing({
    required String pgId,
  }) async {
    try {
      final data = await Request.post(
        url: ApiEndpoints.getMaxNumberOfSharing,
        body: {"category_id": pgId},
      );

      final sharing = data['data']['max_sharing_value'] as String;

      return right(sharing);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, List<RoomWithFloorModel>>>
      getAvailableRoomsWithFloor(
          {required String pgId, required String numberOfSharing}) async {
    try {
      final data = await Request.post(
        url: ApiEndpoints.getAvailableRoomsWithFloor,
        body: {
          "category_id": pgId,
          "sharing": numberOfSharing,
        },
      );

      final roomsWithFloor = (data['data'] as List)
          .map((e) => RoomWithFloorModel.fromJson(e))
          .toList();

      return right(roomsWithFloor);
    } on ServerException catch (e) {
      print(e);
      return left(
          Failure(status: e.status, title: "Error", message: e.message));
    } catch (e) {
      print(e);
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> bookPG(
      {required BookingModel booking}) async {
    try {
      print(booking.toJson());

      await Request.post(
        url: ApiEndpoints.bookPG,
        body: booking.toJson(),
      );

      return right(null);
    } on ServerException catch (e) {
      print(e);
      return left(
          Failure(status: e.status, title: "Error", message: e.message));
    } catch (e) {
      print(e);
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
