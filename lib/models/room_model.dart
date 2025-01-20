class RoomModel {
  final String? id;
  final String? pgId;
  final String? floorId;
  final String name;
  final String sharing;
  final String price;
  final String? pgName;
  final String? floorName;

  RoomModel({
    this.id,
    required this.pgId,
    required this.floorId,
    required this.name,
    required this.sharing,
    required this.price,
    this.pgName,
    this.floorName,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'] as String,
      pgId: json['categiry_id'] as String?,
      floorId: json['sub_category_id'] as String?,
      name: json['name'] as String,
      sharing: json['sharing'] as String,
      price: json['price'] as String,
      pgName: json['category_details']['name'] ?? json['category_name'],
      floorName: json['sub_category_name'],
    );
  }

  Map<String, dynamic> toJson(bool isUpdating) {
    final data = {
      "category_id": pgId,
      "sub_category_id": floorId,
      "name": name,
      "sharing": sharing,
      "price": price,
    };

    if (isUpdating) {
      data['inner_subcategory_id'] = id!;
    }

    return data;
  }
}
