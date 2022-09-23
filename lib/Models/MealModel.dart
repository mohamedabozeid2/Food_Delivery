class MealModel {
  dynamic? mediumSizePrice;
  dynamic? smallSizePrice;
  dynamic? largeSizePrice;
  String? description;
  String? name;
  String? image;

  MealModel({
    required this.description,
    required this.largeSizePrice,
    required this.mediumSizePrice,
    required this.smallSizePrice,
    required this.name,
    required this.image,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    mediumSizePrice = json['mediumSizePrice'];
    largeSizePrice = json['largeSizePrice'];
    smallSizePrice = json['smallSizePrice'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'smallSizePrice': smallSizePrice,
      'mediumSizePrice': mediumSizePrice,
      'largeSizePrice': largeSizePrice,
    };
  }
}
