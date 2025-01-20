class BookingModel {
  String? bookingId;
  String? customerName;
  String? customerMobile;
  String? customerAddress;
  String? roomId;
  String? roomName;
  String? sharing;
  String? price;
  Null? booked;
  Null? leftOverSeats;
  String? pgId;
  String? pgName;
  String? pgImage;
  String? categoryAddress;
  String? floorId;
  String? floorName;

  BookingModel({
    this.bookingId,
    this.customerName,
    this.customerMobile,
    this.customerAddress,
    this.roomId,
    this.roomName,
    this.sharing,
    this.price,
    this.booked,
    this.leftOverSeats,
    this.pgId,
    this.pgName,
    this.pgImage,
    this.categoryAddress,
    this.floorId,
    this.floorName,
  });

  BookingModel.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    customerName = json['customer_name'];
    customerMobile = json['customer_mobile'];
    customerAddress = json['customer_address'];
    roomId = json['inner_subcategory_id'];
    roomName = json['inner_subcategory_name'];
    sharing = json['sharing'];
    price = json['price'];
    booked = json['booked'];
    leftOverSeats = json['left_over_seats'];
    pgId = json['category_id'];
    pgName = json['category_name'];
    pgImage = json['category_image'];
    categoryAddress = json['category_address'];
    floorId = json['sub_category_id'];
    floorName = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['address'] = customerAddress;
    data['mobile'] = customerMobile;
    data['name'] = customerName;
    data['inner_sub_category_id'] = roomId;
    data['sub_category_id'] = floorId;
    data['category_id'] = pgId;
    return data;
  }
}
