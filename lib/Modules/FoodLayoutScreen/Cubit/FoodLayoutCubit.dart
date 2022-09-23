import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/Models/MealModel.dart';
import 'package:food_delivery/Modules/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';

import '../../../Models/CartModel.dart';
import '../../../Models/MealContentModel.dart';
import '../../../Models/RestaurantModel.dart';
import '../../../Models/TagsModel.dart';
import '../../HomeScreen/HomeScreen.dart';

class FoodLayoutCubit extends Cubit<FoodLayoutStates> {
  FoodLayoutCubit() : super(FoodLayoutInitialState());

  static FoodLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
  ];

  List<String> botNavTitles = [
    'FoodLayout',
    'Favorite',
    'My Order',
    'Profile',
  ];
  int currentIndex = 0;

  void changeBotNavBar({required int index}) {
    currentIndex = index;
    emit(FoodLayoutChangeBotNavBarState());
  }

  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'FoodLayout',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Favorite'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.restaurant_outlined), label: 'My Order'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.supervised_user_circle), label: 'Profile'),
  ];

  List<String> sortByList = ['All', 'Near By', 'Most Popular', 'Free Delivery'];
  List<String> foodCategories = ['All', 'Burger', 'Pizza', 'Chicken', 'Fries'];
  int foodCategoriesNavBarIndex = 0;
  int topNavBarCurrentIndex = 0;

  void foodCategoriesChangeNavBar({required int index}) {
    foodCategoriesNavBarIndex = index;
    emit(FoodLayoutChangeBotNavBarState());
  }

  void topBarChangeNavigation({required int index}) {
    topNavBarCurrentIndex = index;
    emit(FoodLayoutChangeNavState());
  }

  List<RestaurantModel> restaurants = [];
  List<List<TagsModel>> tagsList = [];
  List<List<MealModel>> mealsList = [];
  List<String> restaurantId = [];
  List<List<String>> mealId = [];

  void getRestaurants() async {
    restaurants = [];
    tagsList = [];
    mealsList = [];
    emit(FoodLayoutGetRestaurantsLoadingState());
    await FirebaseFirestore.instance
        .collection('Restaurants')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        restaurantId.add(element.id);
        await element.reference.collection('tags').get().then((tags) async {
          await element.reference.collection('meal').get().then((meals) {
            restaurants.add(RestaurantModel.fromJson(element.data()));
            List<MealModel> singleMeal = [];
            List<String> singleMealIds = [];
            for (var element in meals.docs) {
              singleMealIds.add(element.id);
              singleMeal.add(MealModel.fromJson(element.data()));
            }
            mealId.add(singleMealIds);
            mealsList.add(singleMeal);
            List<TagsModel> singleTags = [];
            for (var element in tags.docs) {
              singleTags.add(TagsModel.fromJson(element.data()));
            }
            tagsList.add(singleTags);
          });
        });
      }
      emit(FoodLayoutGetRestaurantsSuccessState());
    }).catchError((error) {
      debugPrint('Error from get restaurants ===> ${error.toString()}');
      emit(FoodLayoutGetRestaurantsErrorState());
    });
  }


  List<MealContentModel> mealContentList = [];

  void getMealContent(
      {required String restaurantDoc, required String mealDoc}) {
    FirebaseFirestore.instance.collection('Restaurants').doc(restaurantDoc)
        .collection('meal').doc(mealDoc)
        .collection('includes').get().then((value){
          for (var element in value.docs) {
            mealContentList.add(MealContentModel.fromJson(element.data()));
          }
    });
  }

  bool moreInfo = false;

  void changeMoreInfo() {
    moreInfo = !moreInfo;
    emit(FoodLayoutShowMoreInfoState());
  }

  int mealQuantity = 0;
  String mealSize = '';
  List<CartModel> cartModel = [];

  void addToCart({required int mealQuantity,
    required double mealPrice,
    required MealModel mealModel}) {
    cartModel.add(
        CartModel(quantity: mealQuantity, meal: mealModel, price: mealPrice));
  }
}
