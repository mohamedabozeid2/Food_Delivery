class RestaurantModel {
  String? name;
  String? info;
  String? id;
  String? highLights;
  String? phoneNumber;
  String? location;
  String? mainLocation;
  dynamic rate;
  String? image;
  String? backgroundImage;

  RestaurantModel(
      {
      required this.name,
      required this.image,
      required this.id,
      required this.phoneNumber,
      required this.mainLocation,
      required this.highLights,
      required this.location,
      required this.info,
      required this.backgroundImage,
      required this.rate});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    id = json['id'];
    location = json['location'];
    image = json['image'];
    name = json['name'];
    backgroundImage = json['backgroundImage'];
    highLights = json['highLights'];
    mainLocation = json['mainLocation'];
    phoneNumber = json['phoneNumber'];
    rate = json['rate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'info': info,
      'location': location,
      'mainLocation': mainLocation,
      'image': image,
      'backgroundImage': backgroundImage,
      'name': name,
      'highLights': highLights,
      'phoneNumber': phoneNumber,
      'rate': rate,
    };
  }
}


