class AdminModel {
  final String? userId;
  final String name;
  final String mobile;
  final String role;

  AdminModel({
    this.userId,
    required this.name,
    required this.mobile,
    required this.role,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return AdminModel(
      userId: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      role: json['role'],
    );
  }
}
