import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/CartScreen/CartScreen.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Widgets/AppBar.dart';

import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Network/Local/CacheHelper.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/utils/helper.dart';
import 'package:get/get.dart';

import 'Cubit/FoodLayoutCubit.dart';
import 'Cubit/FoodLayoutStates.dart';
import 'Widgets/SearchBar.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    FoodLayoutCubit.get(context).getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: defaultAppBar(context: context, inCartScreen: FoodLayoutCubit.get(context).inCartScreen),
          body: state is FoodLayoutGetRestaurantsLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                  color: mainColor,
                ))
              : CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                        fillOverscroll: true,
                        child: FoodLayoutCubit.get(context)
                            .currentScreen /*FoodLayoutCubit.get(context)
                            .screens[FoodLayoutCubit.get(context).currentIndex]*/
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
