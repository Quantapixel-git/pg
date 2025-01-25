import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/user_model.dart';

class UserServices {
  static Future<Either<Failure, List<UserModel>>> searchUser({
    required String searchTerm,
  }) async {
    try {
      final data = await Request.post(url: ApiEndpoints.searchUsers, body: {
        "search": searchTerm,
      });

      final userList = (data['data'] as List)
          .map((floor) => UserModel.fromJson(floor))
          .toList();

      return right(userList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final data = await Request.get(url: ApiEndpoints.getAllUsers);

      final userList = (data['data'] as List)
          .map((floor) => UserModel.fromJson(floor))
          .toList();

      return right(userList);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, List<UserModel>>> getFilteredUsers({
    required String pgId,
    required String floorId,
    required String roomId,
  }) async {
    try {
      final data = await Request.post(url: ApiEndpoints.filterUser, body: {
        "category_id": pgId,
        "sub_category_id": floorId,
        "inner_sub_category_id": roomId
      });

      final userList = (data['data'] as List)
          .map((floor) => UserModel.fromJson(floor))
          .toList();

      return right(userList);
    } on ServerException catch (e) {
      return left(
          Failure(status: e.status, title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> insertUser({
    required UserModel user,
    required File? localAadharImage,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.inserUser,
        body: await user.toJson(false, localAadharImage),
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> deleteUser({
    required String userId,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.deleteUser,
        body: {
          "user_id": userId,
        },
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, void>> updateUser({
    required UserModel user,
    required File? localAadharImage,
  }) async {
    try {
      await Request.post(
        url: ApiEndpoints.updateUser,
        body: await user.toJson(true, localAadharImage),
      );

      return right(null);
    } on ServerException catch (e) {
      print(e.message);
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e);
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
