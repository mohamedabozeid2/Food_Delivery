class MealContentModel{
  String? image;
  String? meal;

  MealContentModel({
    required this.meal,
    required this.image,
});

  MealContentModel.fromJson(Map<String, dynamic> json){
    image = json['image'];
    meal = json['meal'];
  }

  Map<String, dynamic> toMap(){
    return {
      'meal' : meal,
      'image' : image,
    };
  }



}