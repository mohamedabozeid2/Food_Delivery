import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/Modules/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';

import '../HomeScreen.dart';

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
    BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,),label: 'FoodLayout',),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.restaurant_outlined),label: 'My Order'),
    BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),label: 'Profile'),
  ];
}
