class FloorModel {
  final int? id;
  final String categoryId;
  final String name;
  final String pgName;

  FloorModel({
    this.id,
    required this.categoryId,
    required this.name,
    required this.pgName,
  });

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return FloorModel(
      id: int.parse(json['id']),
      categoryId: json['category_id'],
      name: json['name'],
      pgName: json['category_details']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "category_id": categoryId,
    };
  }
}
