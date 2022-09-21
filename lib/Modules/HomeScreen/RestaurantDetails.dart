import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Models/RestaurantModel.dart';
import 'package:food_delivery/Modules/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Modules/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/utils/helper.dart';

import '../../Models/TagsModel.dart';
import '../../Shared/styles/Themes.dart';

class RestaurantDetails extends StatelessWidget {
  RestaurantModel model;
  List<TagsModel> tagsModel;

  RestaurantDetails({required this.model, required this.tagsModel});

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
                            child: Image.network(
                                'https://img.freepik.com/free-photo/kebab-platter-with-tikka-lula-chicken-vegetable-kebabs_140725-256.jpg?w=900&t=st=1663686835~exp=1663687435~hmac=25ac88ffa3ef72a1823a85f2a19793488020136c18f3649ac2540da2fd380d5e'),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Image(image: NetworkImage(model.image!)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              model.name!,
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
                              model.rate.toString(),
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
                                        tagsModel[index].tag!,
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
                                    itemCount: tagsModel.length),
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
                                    model.location!,
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
                                    model.rate.toString(),
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
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, bottom: 20.0),
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
                                                        EdgeInsets.all(6.0),
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
                                                    model.mainLocation!,
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
                                              model.info!,
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
                                              model.highLights!,
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
                                              model.phoneNumber!,
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
                                              padding: EdgeInsets.all(6.0),
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
                                              model.mainLocation!,
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
                                            physics:
                                                NeverScrollableScrollPhysics(),
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
                                      padding: EdgeInsets.all(5),
                                      itemBuilder: (context, index) {
                                        return mealBuilder(context: context);
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 5.0,
                                        );
                                      },
                                      itemCount: 4),
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

  Widget mealBuilder({
    required BuildContext context,
  }) {
    return Material(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: Image.network(
                  width: 100,
                  'https://img.freepik.com/free-photo/front-view-burger-stand_141793-15542.jpg?w=996&t=st=1663718016~exp=1663718616~hmac=84f0867d877f9f30ebd6070496b097713600f4b83fd68dcf9aa8b3ba6c36d52b'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              children: [
                Text(
                  'Meal Name',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'EGP 45.00',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18.0),
                )
              ],
            ),
            Spacer(),
            Icon(Icons.favorite, color: greyTextColor),
          ],
        ),
      ),
    );
  }

  Widget foodCategoriesBuilder(
      {required String text,
      required BuildContext context,
      required int index}) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15.0),
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