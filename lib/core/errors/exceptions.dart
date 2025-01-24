class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
}

class LocalStorageException implements Exception {
  final String message;

  LocalStorageException({required this.message});
}

class ServerException implements Exception {
  final int statusCode;
  final int status;
  final String message;
  final Map<String, dynamic>? data;

  ServerException({
    this.statusCode = 500,
    this.status = 0,
    this.message = "Something went wrong",
    this.data = const {},
  });
}
