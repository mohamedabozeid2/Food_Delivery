import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Network/Local/CacheHelper.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/utils/helper.dart';

import 'Cubit/FoodLayoutCubit.dart';
import 'Cubit/FoodLayoutStates.dart';
import 'Widgets/SearchBar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
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
          appBar: AppBar(
            toolbarHeight: Helper.getScreenHeight(context: context) * 0.2,
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Delivery to',
                        style:
                        Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 13.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Alexandria',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 17.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SearchBar(),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: state is FoodLayoutGetRestaurantsLoadingState ? const Center(child: CircularProgressIndicator()): CustomScrollView(
            slivers: [
              // SliverAppBar(
              //
              //   toolbarHeight: Helper.getScreenHeight(context: context) * 0.2,
              //   title: Row(
              //     children: [
              //       Expanded(
              //         child: Column(
              //           children: [
              //             Text(
              //               'Delivery to',
              //               style:
              //                   Theme.of(context).textTheme.subtitle2!.copyWith(
              //                         fontSize: 13.0,
              //                       ),
              //             ),
              //             const SizedBox(
              //               height: 15.0,
              //             ),
              //             Text(
              //               'Alexandria',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyText2!
              //                   .copyWith(fontSize: 17.0),
              //             ),
              //             const SizedBox(
              //               height: 15.0,
              //             ),
              //             SearchBar(),
              //             const SizedBox(
              //               height: 10.0,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              SliverFillRemaining(
                  fillOverscroll: true,
                  child: FoodLayoutCubit.get(context)
                      .screens[FoodLayoutCubit.get(context).currentIndex])
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: inActiveColor,
            onPressed: () {
              print(FoodLayoutCubit.get(context).currentIndex);
            },
            child: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 7.0,
            clipBehavior: Clip.antiAlias,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
              selectedItemColor: mainColor,
              selectedIconTheme: IconThemeData(color: mainColor),
              type: BottomNavigationBarType.fixed,
              currentIndex: FoodLayoutCubit.get(context).currentIndex,
              onTap: (index) {
                FoodLayoutCubit.get(context).changeBotNavBar(index: index);
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
