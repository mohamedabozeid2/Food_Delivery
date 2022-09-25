import 'package:food_delivery/DataModels//MealModel.dart';

class CartModel {
  MealModel meal;
  int quantity;
  dynamic price;

  CartModel({required this.quantity, required this.meal, required this.price});
}
