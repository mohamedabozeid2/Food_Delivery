import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/DataModels/MealModel.dart';
import 'package:food_delivery/Presentation/CartScreen/CartScreen.dart';
import 'package:food_delivery/Presentation/FavoriteScreen/FavoriteScreen.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Presentation/MyOrdersScreen/MyOrdersScreen.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileScreen.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:get/get.dart';
import '../../../DataModels/CartModel.dart';
import '../../../DataModels/MealContentModel.dart';
import '../../../DataModels/RestaurantModel.dart';
import '../../../DataModels/TagsModel.dart';
import '../../HomeScreen/HomeScreen.dart';

class FoodLayoutCubit extends Cubit<FoodLayoutStates> {
  FoodLayoutCubit() : super(FoodLayoutInitialState());

  static FoodLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    MyOrdersScreen(),
    ProfileScreen(),
  ];

  Widget currentScreen = HomeScreen();
  List<String> botNavTitles = [
    'FoodLayout',
    'Favorite',
    'My Order',
    'Profile',
  ];
  int currentIndex = 0;
  bool inCartScreen = false;
  bool inProfileScreen = false;

  void changeBotNavBar({required int index, required BuildContext context}) {
    if (index == 0) {
      currentIndex = index;
      inProfileScreen = false;
      inCartScreen = false;
      currentScreen = HomeScreen();
    } else if (index == 1) {
      currentIndex = index;
      inCartScreen = false;
      inProfileScreen = false;
      currentScreen = FavoriteScreen();
    } else if (index == 2) {
      currentIndex = index;
      inProfileScreen = false;
      inCartScreen = false;
      currentScreen = MyOrdersScreen();
    } else if (index == 3) {
      currentIndex = index;
      inCartScreen = false;
      inProfileScreen = true;
      currentScreen = ProfileScreen();
    } else {
      inCartScreen = true;
      inProfileScreen = false;
      currentScreen = CartScreen();
    }
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
  List<MealContentModel> mealContentList = [];
  List<String> favID = [];
  List<MealModel> favMeals = [];

  void getRestaurants() async {
    restaurants = [];
    tagsList = [];
    mealsList = [];
    mealContentList = [];
    emit(FoodLayoutGetRestaurantsLoadingState());
    await FirebaseFirestore.instance
        .collection('Restaurants')
        .get()
        .then((value) async {
      await getFav().then((_) async {
        for (var element in value.docs) {
          restaurantId.add(element.id);
          await element.reference.collection('tags').get().then((tags) async {
            await element.reference
                .collection('meal')
                .get()
                .then((meals) async {
              restaurants.add(RestaurantModel.fromJson(element.data()));
              List<MealModel> singleMeal = [];
              List<String> singleMealIds = [];
              for (int i = 0; i < meals.docs.length; i++) {
                // await meals.docs[i].reference.collection('includes').get().then((value){
                // value.docs.forEach((element) {
                //   mealContentList.add(MealContentModel.fromJson(element.data()));
                // });
                singleMealIds.add(meals.docs[i].id);
                singleMeal.add(MealModel.fromJson(meals.docs[i].data()));
                // if (favID.contains(singleMeal[i].id)) {
                //   favMeals.add(singleMeal[i]);
                // }
                // });
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
      });

      emit(FoodLayoutGetRestaurantsSuccessState());
    }).catchError((error) {
      debugPrint('Error from get restaurants ===> ${error.toString()}');
      emit(FoodLayoutGetRestaurantsErrorState());
    });
  }



  void removeFromCart({required int index}){
    cartModelList.removeAt(index);
    calcCheckPrice(cartModelList: cartModelList);
  }
  void getMealContent(
      {required String restaurantDoc, required String mealDoc}) {
    mealContentList = [];
    emit(FoodLayoutGetMealContentLoadingState());
    FirebaseFirestore.instance
        .collection('Restaurants')
        .doc(restaurantDoc)
        .collection('meal')
        .doc(mealDoc)
        .collection('includes')
        .get()
        .then((value) {
      for (var element in value.docs) {
        mealContentList.add(MealContentModel.fromJson(element.data()));
      }
      emit(FoodLayoutGetMealContentSuccessState());
    }).catchError((error) {
      debugPrint('Error in meal content ===>${error.toString()}');
      emit(FoodLayoutGetMealContentErrorState());
    });
  }

  bool moreInfo = false;

  void changeMoreInfo() {
    moreInfo = !moreInfo;
    emit(FoodLayoutShowMoreInfoState());
  }

  Future<void> getFav({bool fromAddFav = false}) async {
    favID = [];
    favMeals = [];
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('fav')
        .get()
        .then((value) {
      for (var element in value.docs) {
        favID.add(element.id);
        favMeals.add(MealModel.fromJson(element.data()));
      }
      if (fromAddFav) {
        emit(FoodLayoutAddFavoriteSuccessState());
      }
    }).catchError((error) {
      debugPrint('Error in remove fav ${error.toString()}');
      emit(FoodLayoutAddFavoriteErrorState());
    });
  }

  void calcCheckPrice({required List<CartModel> cartModelList}){
    totalCartPrice = 0;
    for(int i=0; i<cartModelList.length; i++){
      totalCartPrice += cartModelList[i].totalPrice;
    }
    emit(FoodCalcPriceState());

  }

  dynamic calcTotalPrice({
    required dynamic price,
    required int quantity,
  }) {
    dynamic totalPrice = price * quantity;
    return totalPrice;
  }

  List<CartModel> cartModelList = [];
  dynamic totalPrice = 0;

  void addToCart(
      {required MealModel mealModel,
      required int quantity,
      required dynamic price,
      required dynamic totalPrice}) {
    CartModel cartModel = CartModel(
        mealModel: mealModel,
        quantity: quantity,
        price: price,
        totalPrice: totalPrice);
    totalPrice += price;
    cartModelList.add(cartModel);
    Get.snackbar(
        'Food Delivery', 'The order is added to your cart successfully',
        colorText: Colors.white, backgroundColor: Colors.green);
  }

  void addOrRemoveFavorite({required MealModel mealModel}) {
    emit(FoodLayoutAddFavoriteLoadingState());
    if (favID.contains(mealModel.id)) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('fav')
          .doc(mealModel.id)
          .delete()
          .then((value) {
        getFav(fromAddFav: true);
      });
    } else {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('fav')
          .doc(mealModel.id)
          .set(mealModel.toMap())
          .then((value) {
        getFav(fromAddFav: true);
      });
    }
  }
}
