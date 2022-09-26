class MealModel {
  dynamic mediumSizePrice;
  dynamic smallSizePrice;
  dynamic largeSizePrice;
  String? restaurantName;
  String? description;
  String? id;
  String? restaurantId;
  String? name;
  String? image;

  MealModel({
    required this.description,
    required this.restaurantId,
    required this.largeSizePrice,
    required this.mediumSizePrice,
    required this.smallSizePrice,
    required this.restaurantName,
    required this.name,
    required this.id,
    required this.image,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    restaurantId = json['restaurantId'];
    id = json['id'];
    restaurantName = json['restaurantName'];
    description = json['description'];
    mediumSizePrice = json['mediumSizePrice'];
    largeSizePrice = json['largeSizePrice'];
    smallSizePrice = json['smallSizePrice'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'id': id,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'description': description,
      'smallSizePrice': smallSizePrice,
      'mediumSizePrice': mediumSizePrice,
      'largeSizePrice': largeSizePrice,
    };
  }
}
