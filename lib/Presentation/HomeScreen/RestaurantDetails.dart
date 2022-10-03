import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/DataModels/MealModel.dart';
import 'package:food_delivery/DataModels/RestaurantModel.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Presentation/HomeScreen/MealDetails.dart';
import 'package:food_delivery/Presentation/HomeScreen/Widgets/MealBuilder.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:lottie/lottie.dart';

import '../../DataModels/TagsModel.dart';
import '../../Shared/styles/Themes.dart';
import '../../core/widgets/adaptive_indicator.dart';

class RestaurantDetails extends StatefulWidget {
  RestaurantModel model;
  List<TagsModel> tagsModel;
  int? restaurantIndex;

  RestaurantDetails(
      {required this.model,
      required this.tagsModel,
      required this.restaurantIndex});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: Helper.getScreenHeight(context: context) * 0.35,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.infinity,
                            height:
                                Helper.getScreenHeight(context: context) * 0.3,
                            child: CachedNetworkImage(
                              imageUrl: "${widget.model.backgroundImage}",
                              key: UniqueKey(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(child: AdaptiveIndicator(os: Platform.operatingSystem, color: mainColor,)),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0)),
                          child:
                          CachedNetworkImage(
                            imageUrl: "${widget.model.image}",
                            key: UniqueKey(),
                            // fit: BoxFit.cover,
                            placeholder: (context, url) => Center(child: AdaptiveIndicator(os: Platform.operatingSystem, color: mainColor,)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Helper.getScreenWidth(context: context) * 0.05,
                        left: Helper.getScreenWidth(context: context) * 0.05,
                        right: Helper.getScreenWidth(context: context) * 0.05),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.model.name!,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.star,
                              color: mainColor,
                              size: 14.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              widget.model.rate.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: mainColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 20,
                          child: Row(
                            children: [
                              const Icon(Icons.restaurant_outlined,
                                  color: Colors.black, size: 14.0),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        widget.tagsModel[index].tag!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.black),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                    itemCount: widget.tagsModel.length),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    widget.model.location!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    size: 14,
                                    color: mainColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    widget.model.rate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.delivery_dining,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Free',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        myDivider(color: greyTextColor),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Restaurant info',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 16.0),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                FoodLayoutCubit.get(context).changeMoreInfo();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    FoodLayoutCubit.get(context).moreInfo
                                        ? 'Less info'
                                        : 'More info',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          fontSize: 13,
                                        ),
                                  ),
                                  Icon(
                                    FoodLayoutCubit.get(context).moreInfo
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    size: 14.0,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: Helper.getScreenWidth(context: context) * 0.05,
                          left: Helper.getScreenWidth(context: context) * 0.05,
                          bottom:
                              Helper.getScreenWidth(context: context) * 0.05),
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              children: [
                                FoodLayoutCubit.get(context).moreInfo
                                    ? Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    padding:
                                                        EdgeInsets.all(Helper.getScreenWidth(context: context)*0.02),
                                                    decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: const Icon(
                                                      Icons.home,
                                                      color: Colors.white,
                                                    )),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    widget.model.mainLocation!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2!
                                                        .copyWith(
                                                          color: greyTextColor,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            myDivider(color: greyTextColor),
                                            Text(
                                              'Info',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff634545),
                                                      fontSize: 16.0),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              widget.model.info!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: greyTextColor,
                                                      fontSize: 14.0),
                                            ),
                                            myDivider(color: greyTextColor),
                                            Text(
                                              'HighLight',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff634545),
                                                      fontSize: 16.0),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              widget.model.highLights!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: greyTextColor,
                                                      fontSize: 14.0),
                                            ),
                                            myDivider(color: greyTextColor),
                                            Text(
                                              'Phone',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff634545),
                                                      fontSize: 16.0),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              widget.model.phoneNumber!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: greyTextColor,
                                                      fontSize: 14.0),
                                            ),
                                          ],
                                        ))
                                    : Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.02),
                                              decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: const Icon(
                                                Icons.home,
                                                color: Colors.white,
                                              )),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              widget.model.mainLocation!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                    color: greyTextColor,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                myDivider(color: greyTextColor),
                                Container(
                                  height:
                                      Helper.getScreenHeight(context: context) *
                                          0.052,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return foodCategoriesBuilder(
                                                text:
                                                    FoodLayoutCubit.get(context)
                                                        .foodCategories[index],
                                                index: index,
                                                context: context,
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                width: 10.0,
                                              );
                                            },
                                            itemCount:
                                                FoodLayoutCubit.get(context)
                                                    .foodCategories
                                                    .length),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  height: 300.0,
                                  child: ListView.separated(
                                      // shrinkWrap: false,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.02),
                                      itemBuilder: (context, index) {
                                        return MealBuilder(
                                            model: FoodLayoutCubit.get(context)
                                                    .mealsList[
                                                widget.restaurantIndex!],
                                            index: index,
                                            restaurantIndex:
                                                widget.restaurantIndex!);
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 20.0,
                                        );
                                      },
                                      itemCount: FoodLayoutCubit.get(context)
                                          .mealsList[widget.restaurantIndex!]
                                          .length),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget foodCategoriesBuilder(
      {required String text,
      required BuildContext context,
      required int index}) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.04),
        decoration: BoxDecoration(
            color:
                FoodLayoutCubit.get(context).foodCategoriesNavBarIndex == index
                    ? mainColor
                    : inActiveColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: FoodLayoutCubit.get(context).foodCategoriesNavBarIndex ==
                      index
                  ? Colors.white
                  : Color(0xff655E5C),
              fontSize: 14.0),
        ),
      ),
      onTap: () {
        FoodLayoutCubit.get(context).foodCategoriesChangeNavBar(index: index);
      },
    );
  }
}
