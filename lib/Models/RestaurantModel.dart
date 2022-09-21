class RestaurantModel {
  String? name;
  String? info;
  String? highLights;
  String? phoneNumber;
  String? location;
  String? mainLocation;
  double? rate;
  String? image;

  RestaurantModel(
      {
      required this.name,
      required this.image,
      required this.phoneNumber,
      required this.mainLocation,
      required this.highLights,
      required this.location,
      required this.info,
      required this.rate});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    location = json['location'];
    image = json['image'];
    name = json['name'];
    highLights = json['highLights'];
    mainLocation = json['mainLocation'];
    phoneNumber = json['phoneNumber'];
    rate = json['rate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info,
      'location': location,
      'mainLocation': mainLocation,
      'image': image,
      'name': name,
      'highLights': highLights,
      'phoneNumber': phoneNumber,
      'rate': rate,
    };
  }
}


