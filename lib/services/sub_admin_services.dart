import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/sub_admin_model.dart';

class SubAdminServices {
  static Future<Either<Failure, List<SubAdminModel>>> getAllSubAdmin() async {
    try {
      final data = await Request.get(url: ApiEndpoints.getAllSubAdmin);

      final subAdminList = (data['data'] as List)
          .map((subAdmin) => SubAdminModel.fromJson(subAdmin))
          .toList();

      return right(subAdminList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> insertSubAdmin({
    required SubAdminModel subAdmin,
    required String password,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.insertSubAdmin,
        body: subAdmin.toJson(false, password),
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> deleteSubAdmin({
    required String subAdminId,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.deleteSubAdmin,
        body: {"admin_id": subAdminId},
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> updateSubAdmin({
    required SubAdminModel subAdmin,
    required String? password,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.updateSubAdmin,
        body: subAdmin.toJson(true, password),
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
