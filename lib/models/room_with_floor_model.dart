class BookRoomModel {
  final String id;
  final String name;
  final String sharing;
  final String? booked;
  final String leftoverSeats;
  final String price;

  BookRoomModel({
    required this.id,
    required this.name,
    required this.sharing,
    required this.booked,
    required this.leftoverSeats,
    required this.price,
  });

  factory BookRoomModel.fromJson(Map<String, dynamic> json) {
    return BookRoomModel(
      id: json['id'],
      name: json['name'],
      sharing: json['sharing'],
      booked: json['booked'] as String?,
      leftoverSeats: (json['leftover_seats'] as int).toString(),
      price: json['price'],
    );
  }
}

class RoomWithFloorModel {
  final String floorId;
  final String floorName;
  final List<BookRoomModel> rooms;

  RoomWithFloorModel({
    required this.floorId,
    required this.floorName,
    required this.rooms,
  });

  factory RoomWithFloorModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return RoomWithFloorModel(
      floorId: (json['floor_id'] as int).toString(),
      floorName: json['floor_name'] as String,
      rooms: (json['rooms'] as List)
          .map(
            (room) => BookRoomModel.fromJson(room),
          )
          .toList(),
    );
  }
}
