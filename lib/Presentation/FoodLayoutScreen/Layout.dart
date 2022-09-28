import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Widgets/AppBar.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';

import 'Cubit/FoodLayoutCubit.dart';
import 'Cubit/FoodLayoutStates.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  void initState() {
    FoodLayoutCubit.get(context).getRestaurants();
    if(userModel == null){
      FoodLayoutCubit.get(context).getUserData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(context: context),
          body: state is FoodLayoutGetRestaurantsLoadingState || state is FoodLayoutGetUserDataLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                  color: mainColor,
                ))
              : CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                        fillOverscroll: true,
                        child: FoodLayoutCubit.get(context)
                            .currentScreen
                        )
                  ],
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: FoodLayoutCubit.get(context).inCartScreen
                ? mainColor
                : inActiveColor,
            onPressed: () {
              FoodLayoutCubit.get(context)
                  .changeBotNavBar(index: 5, context: context);
            },
            child: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 7.0,
            clipBehavior: Clip.antiAlias,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
              selectedFontSize:  FoodLayoutCubit.get(context).inCartScreen ? 12 : 14,
              selectedItemColor: FoodLayoutCubit.get(context).inCartScreen
                  ? greyTextColor
                  : mainColor,
              selectedIconTheme: IconThemeData(
                  color: FoodLayoutCubit.get(context).inCartScreen
                      ? greyTextColor
                      : mainColor),
              type: BottomNavigationBarType.fixed,
              currentIndex: FoodLayoutCubit.get(context).currentIndex,
              onTap: (index) {
                FoodLayoutCubit.get(context)
                    .changeBotNavBar(index: index, context: context);
              },
              elevation: 0.0,
              items: FoodLayoutCubit.get(context).bottomNavItems,
            ),
          ),
        );
      },
    );
  }
}
