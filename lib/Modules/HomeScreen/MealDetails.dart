import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Models/MealModel.dart';
import 'package:food_delivery/Modules/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/utils/helper.dart';

import '../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';

class MealDetails extends StatefulWidget {
  MealModel model;
  int index;
  String restaurantId;
  int restaurantIndex;

  MealDetails({required this.model,required this.index, required this.restaurantId, required this.restaurantIndex});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  void initState() {
    print('===================>,dsa  ${FoodLayoutCubit.get(context).mealId[widget.restaurantIndex][widget.index]}');
    // FoodLayoutCubit.get(context).getMealContent(restaurantDoc: restaurantDoc, mealDoc: mealDoc)
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100.0))),
                      child: Image.network(widget.model.image!)),
                  Container(
                    padding: EdgeInsets.all(2.0),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: greyTextColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(50)),
                    child: favoriteButton(
                        fun: () {
                          print('love');
                        },
                        iconColor: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: Helper.getScreenWidth(context: context) * 0.95,
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          quantityButton(
                              icon: Icons.minimize,
                              fun: () {
                                if (FoodLayoutCubit.get(context).mealQuantity > 0) {
                                  setState(() {
                                    FoodLayoutCubit.get(context).mealQuantity--;
                                  });
                                }
                              },
                              context: context,
                              backgroundColor: greyTextColor),
                          const SizedBox(
                            width: 30,
                          ),
                          Text('${FoodLayoutCubit.get(context).mealQuantity}'),
                          const SizedBox(
                            width: 30,
                          ),
                          quantityButton(
                              icon: Icons.add,
                              fun: () {
                                setState(() {
                                  FoodLayoutCubit.get(context).mealQuantity++;
                                });
                              },
                              context: context,
                              backgroundColor: mainColor),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Helper.getScreenWidth(context: context) * 0.95,
                      child: Row(
                        children: [
                          Expanded(
                            child: cartButton(
                                context: context,
                                text: 'S',
                                fun: () {
                                  setState(() {
                                    FoodLayoutCubit.get(context).mealSize = 'small';
                                  });
                                },
                                color:
                                FoodLayoutCubit.get(context).mealSize == 'small'
                                    ? mainColor
                                    : Colors.white,
                                price: widget.model.smallSizePrice.toString()),
                          ),
                          Expanded(
                            child: cartButton(
                                context: context,
                                text: 'M',
                                fun: () {
                                  setState(() {
                                    FoodLayoutCubit.get(context).mealSize =
                                    'medium';
                                  });
                                },
                                color: FoodLayoutCubit.get(context).mealSize ==
                                    'medium'
                                    ? mainColor
                                    : Colors.white,
                                price: widget.model.mediumSizePrice.toString()),
                          ),
                          Expanded(
                            child: cartButton(
                                context: context,
                                text: 'L',
                                fun: () {
                                  setState(() {
                                    FoodLayoutCubit.get(context).mealSize = 'large';
                                  });
                                },
                                color:
                                FoodLayoutCubit.get(context).mealSize == 'large'
                                    ? mainColor
                                    : Colors.white,
                                price: widget.model.largeSizePrice.toString()),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      widget.model.description!,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: Helper.getScreenWidth(context: context) * 0.95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Includes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 18.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}