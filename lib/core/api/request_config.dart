import 'package:dio/dio.dart';
import 'package:pg/core/api/api_endpoints.dart';

final _options = BaseOptions(
  baseUrl: ApiEndpoints.baseUrl,
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 3),
  headers: {"Content-Type": "application/json"},
);

class RequestConfig {
  static final dio = Dio(_options);
}
