import 'package:food_delivery/DataModels/MealModel.dart';

class CartModel{
  MealModel mealModel;
  dynamic price;
  dynamic totalPrice;
  int quantity;

  CartModel({required this.mealModel, required this.quantity, required this.price, required this.totalPrice});
}