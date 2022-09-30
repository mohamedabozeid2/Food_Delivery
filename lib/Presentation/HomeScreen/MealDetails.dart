import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/DataModels/MealContentModel.dart';
import 'package:food_delivery/DataModels/MealModel.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:get/get.dart';

import '../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';

class MealDetails extends StatefulWidget {
  MealModel model;
  int index;
  String restaurantId;
  int restaurantIndex;
  int quantity = 0;
  dynamic price = 0;
  dynamic totalPrice = 0;

  MealDetails(
      {required this.model,
      required this.index,
      required this.restaurantId,
      required this.restaurantIndex});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  void initState() {
    FoodLayoutCubit.get(context).getMealContent(
        restaurantDoc:
            FoodLayoutCubit.get(context).restaurantId[widget.restaurantIndex],
        mealDoc: FoodLayoutCubit.get(context).mealId[widget.restaurantIndex]
            [widget.index]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
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
                          margin: EdgeInsets.only(
                              right: Helper.getScreenWidth(context: context) *
                                  0.05),
                          decoration: BoxDecoration(
                              color: FoodLayoutCubit.get(context)
                                      .favID
                                      .contains(widget.model.id)
                                  ? mainColor
                                  : greyTextColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(50)),
                          child: favoriteButton(
                              fun: () {
                                FoodLayoutCubit.get(context)
                                    .addOrRemoveFavorite(
                                        mealModel: widget.model);
                              },
                              iconColor: Colors.white),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(
                            right:
                                Helper.getScreenWidth(context: context) * 0.05,
                            left:
                                Helper.getScreenWidth(context: context) * 0.05,
                            top:
                                Helper.getScreenWidth(context: context) * 0.05),
                        child: Column(
                          children: [
                            Container(
                              width: Helper.getScreenWidth(context: context) *
                                  0.95,
                              padding: EdgeInsets.only(
                                  bottom:
                                      Helper.getScreenWidth(context: context) *
                                          0.05),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  quantityButton(
                                      icon: Icons.minimize,
                                      fun: () {
                                        if (widget.quantity > 0) {
                                          setState(() {
                                            widget.quantity--;
                                            widget.totalPrice =
                                                FoodLayoutCubit.get(context)
                                                    .calcTotalPrice(
                                                        price: widget.price,
                                                        quantity:
                                                            widget.quantity);
                                          });
                                        }
                                      },
                                      context: context,
                                      backgroundColor: greyTextColor),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text('${widget.quantity}'),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  quantityButton(
                                      icon: Icons.add,
                                      fun: () {
                                        setState(() {
                                          widget.quantity++;
                                          widget.totalPrice =
                                              FoodLayoutCubit.get(context)
                                                  .calcTotalPrice(
                                                      price: widget.price,
                                                      quantity:
                                                          widget.quantity);
                                        });
                                      },
                                      context: context,
                                      backgroundColor: mainColor),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Helper.getScreenWidth(context: context) *
                                  0.95,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: cartButton(
                                        context: context,
                                        text: 'S',
                                        fun: () {
                                          setState(() {
                                            widget.price =
                                                widget.model.smallSizePrice;
                                            widget.totalPrice =
                                                FoodLayoutCubit.get(context)
                                                    .calcTotalPrice(
                                                        price: widget.price,
                                                        quantity:
                                                            widget.quantity);
                                          });
                                        },
                                        color: widget.price ==
                                                widget.model.smallSizePrice
                                            ? mainColor
                                            : Colors.white,
                                        price: widget.model.smallSizePrice
                                            .toString()),
                                  ),
                                  Expanded(
                                    child: cartButton(
                                        context: context,
                                        text: 'M',
                                        fun: () {
                                          setState(() {
                                            widget.price =
                                                widget.model.mediumSizePrice;
                                            widget.totalPrice =
                                                FoodLayoutCubit.get(context)
                                                    .calcTotalPrice(
                                                        price: widget.price,
                                                        quantity:
                                                            widget.quantity);
                                          });
                                        },
                                        color: widget.price ==
                                                widget.model.mediumSizePrice
                                            ? mainColor
                                            : Colors.white,
                                        price: widget.model.mediumSizePrice
                                            .toString()),
                                  ),
                                  Expanded(
                                    child: cartButton(
                                        context: context,
                                        text: 'L',
                                        fun: () {
                                          setState(() {
                                            widget.price =
                                                widget.model.largeSizePrice;
                                            widget.totalPrice =
                                                FoodLayoutCubit.get(context)
                                                    .calcTotalPrice(
                                                        price: widget.price,
                                                        quantity:
                                                            widget.quantity);
                                          });
                                        },
                                        color: widget.price ==
                                                widget.model.largeSizePrice
                                            ? mainColor
                                            : Colors.white,
                                        price: widget.model.largeSizePrice
                                            .toString()),
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
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            if (state is FoodLayoutGetMealContentLoadingState)
                              Center(
                                  child: CircularProgressIndicator(
                                color: mainColor,
                              ))
                            else
                              Expanded(
                                child: SizedBox(
                                  width:
                                      Helper.getScreenWidth(context: context) *
                                          0.95,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Includes',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(fontSize: 18.0),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              return buildMealContentItem(
                                                  model: FoodLayoutCubit.get(
                                                          context)
                                                      .mealContentList[index]);
                                            },
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                height: 15.0,
                                              );
                                            },
                                            itemCount:
                                                FoodLayoutCubit.get(context)
                                                    .mealContentList
                                                    .length),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 10.0,
                      child: Container(
                        height: Helper.getScreenHeight(context: context) * 0.1,
                        padding: EdgeInsets.all(
                            Helper.getScreenWidth(context: context) * 0.05),
                        child: Row(
                          children: [
                            Expanded(
                                child: buttonContainer(
                                    fun: () {},
                                    color: Colors.white,
                                    context: context,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Total Price',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          Text('${widget.totalPrice}')
                                        ],
                                      ),
                                    ))),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                                child: buttonContainer(
                                    color: mainColor,
                                    fun: () {
                                      if (widget.price != 0 &&
                                          widget.quantity != 0) {
                                        FoodLayoutCubit.get(context).addToCart(
                                            mealModel: widget.model,
                                            quantity: widget.quantity,
                                            totalPrice: widget.totalPrice,
                                            price: widget.price);
                                      } else if (widget.price == 0) {
                                        Get.snackbar('Food Delivery',
                                            'Please choose the meal size',
                                            colorText: Colors.white,
                                            backgroundColor: Colors.redAccent);
                                      } else if (widget.quantity == 0) {
                                        Get.snackbar('Food Delivery',
                                            'Please choose your meal quanityt',
                                            backgroundColor: Colors.redAccent,
                                            colorText: Colors.white);
                                      }
                                    },
                                    context: context,
                                    child: Center(
                                        child: Text(
                                      'Add To Cart',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                    )))),
                          ],
                        ),
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

  Widget buildMealContentItem({required MealContentModel model}) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: Image.network(
            model.image!,
            width: Helper.getScreenWidth(context: context) * 0.3,
            fit: BoxFit.cover,
            height: Helper.getScreenHeight(context: context) * 0.1,
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Text(model.meal!),
      ],
    );
  }
}
