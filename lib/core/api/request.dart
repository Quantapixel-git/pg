import "package:dio/dio.dart";
import "package:pg/core/api/request_config.dart";
import "package:pg/core/errors/exceptions.dart";

class Request {
  static Future<dynamic> get({
    required String url,
  }) async {
    try {
      final res = await RequestConfig.dio.get(
        url,
      );

      if (res.statusCode != 200) {
        throw ServerException(
          statusCode: res.statusCode ?? 500,
          message: res.data['message'] ?? "Something wnet wrong",
          data: res.data,
        );
      }

      return res.data;
    } on DioException catch (e) {
      throw ServerException(
        status: e.response?.data['status'] ?? "Error",
        statusCode: e.response?.statusCode ?? 500,
        message: e.response?.data['message'] ??
            e.response?.data['msg'] ??
            "Something went wrong",
        data: e.response?.data,
      );
    }
  }

  // This function will help to send Post request
  static Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    bool isFormData = true,
  }) async {
    try {
      final res = await RequestConfig.dio.post(
        url,
        data: isFormData ? FormData.fromMap(body) : body,
      );

      return res.data;
    } on DioException catch (e) {
      print("Response is .....");
      print(e.response);

      throw ServerException(
        status: e.response?.data['status'],
        statusCode: e.response?.statusCode ?? 500,
        message: e.response?.data['message'] ??
            (e.response as Map?)?['message'] ??
            e.response?.data['msg'] ??
            "Something went wrong",
        data: e.response?.data,
      );
    }
  }

  // This function will help to send Delete request
  static Future<dynamic> delete({
    required String url,
    required Map<String, dynamic>? body,
    bool isFormData = true,
  }) async {
    try {
      final res = await RequestConfig.dio.delete(
        url,
        data: body,
      );

      if (res.statusCode != 200) {
        throw ServerException(
          message: res.data['message'],
          status: res.data['status'],
          data: res.data['data'],
          statusCode: res.statusCode ?? 500,
        );
      }

      return res.data;
    } on DioException catch (e) {
      throw ServerException();
    }
  }

  // This function will help to send Put(Update) request
  static Future<dynamic> put({
    required String url,
    required Map<String, dynamic>? body,
    bool isFormData = true,
  }) async {
    try {
      final res = await RequestConfig.dio.put(
        url,
        data: body,
      );

      if (res.statusCode != 200) {
        throw ServerException(
          message: res.data['message'],
          status: res.data['status'],
          data: res.data['data'],
          statusCode: res.statusCode ?? 500,
        );
      }

      return res.data;
    } on DioException catch (e) {
      throw ServerException();
    }
  }
}
