import 'package:fpdart/fpdart.dart';
import 'package:pg/core/api/api_endpoints.dart';
import 'package:pg/core/api/request.dart';
import 'package:pg/core/errors/exceptions.dart';
import 'package:pg/core/errors/failure.dart';
import 'package:pg/models/admin_model.dart';
import 'package:pg/models/user_model.dart';

class AuthServices {
  static Future<Either<Failure, UserModel>> userLogin({
    required String mobile,
    required String password,
  }) async {
    try {
      final data = await Request.post(url: ApiEndpoints.userLogin, body: {
        "mobile": mobile,
        "password": password,
      });

      final user = UserModel.fromJson(data['data'] as Map<String, dynamic>);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }

  static Future<Either<Failure, AdminModel>> adminLogin({
    required String mobile,
    required String password,
  }) async {
    try {
      final data = await Request.post(url: ApiEndpoints.adminLogin, body: {
        "mobile": mobile,
        "password": password,
      });

      final user = AdminModel.fromJson(data['data'] as Map<String, dynamic>);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(title: "Error", message: e.message));
    } catch (e) {
      print(e.toString());
      return left(Failure(title: "Error", message: "Something went wrong"));
    }
  }
}
