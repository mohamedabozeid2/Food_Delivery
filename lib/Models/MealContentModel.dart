class MealContentModel{
  String? image;
  String? name;

  MealContentModel({
    required this.name,
    required this.image,
});

  MealContentModel.fromJson(Map<String, dynamic> json){
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'image' : image,
    };
  }



}