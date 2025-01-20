class SubAdminModel {
  final String? id;
  final String name;
  final String mobile;
  final String role;

  SubAdminModel({
    this.id,
    required this.name,
    required this.mobile,
    required this.role,
  });

  factory SubAdminModel.fromJson(Map<String, dynamic> json) {
    return SubAdminModel(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson(final bool isUpdating, final String? password) {
    final jsonData = {
      "name": name,
      "mobile": mobile,
      "role": role,
    };

    if (password != null) {
      jsonData['password'] = password;
    }

    if (isUpdating) {
      jsonData['admin_id'] = id!;
    }

    return jsonData;
  }
}
