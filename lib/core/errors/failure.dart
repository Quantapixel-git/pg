class Failure {
  final int? status;
  final String title;
  final String message;

  Failure({
    this.title = "Error",
    required this.message,
    this.status,
  });
}
