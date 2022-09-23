import 'package:food_delivery/Models/MealModel.dart';

class CartModel {
  MealModel meal;
  int quantity;
  dynamic price;

  CartModel({required this.quantity, required this.meal, required this.price});
}
