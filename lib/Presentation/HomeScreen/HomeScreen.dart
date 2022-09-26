import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/DataModels/RestaurantModel.dart';
import 'package:food_delivery/DataModels/TagsModel.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Presentation/HomeScreen/RestaurantDetails.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/utils/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: Helper.getScreenHeight(context: context) * 0.07,
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return sortByItemBuilder(
                            text:
                                FoodLayoutCubit.get(context).sortByList[index],
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
                            FoodLayoutCubit.get(context).sortByList.length),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return restaurantItemBuilder(
                        context: context,
                        index: index,
                        model: FoodLayoutCubit.get(context).restaurants[index],
                        tagsModel:
                            FoodLayoutCubit.get(context).tagsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5.0,
                    );
                  },
                  itemCount: FoodLayoutCubit.get(context).restaurants.length),
            )
          ],
        );
      },
    );
  }

  Widget sortByItemBuilder(
      {required String text,
      required BuildContext context,
      required int index}) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: FoodLayoutCubit.get(context).topNavBarCurrentIndex == index
                ? mainColor
                : inActiveColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: FoodLayoutCubit.get(context).topNavBarCurrentIndex == index
                  ? Colors.white
                  : Color(0xff655E5C),
              fontSize: 14.0),
        ),
      ),
      onTap: () {
        FoodLayoutCubit.get(context).topBarChangeNavigation(index: index);
      },
    );
  }

  Widget restaurantItemBuilder({
    required RestaurantModel model,
    required List<TagsModel> tagsModel,
    required BuildContext context,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            RestaurantDetails(
              model: model,
              tagsModel: tagsModel,
              restaurantIndex: index,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.network(model.image!),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          Icon(Icons.restaurant_outlined,
                              color: greyTextColor, size: 14.0),
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
                                        .copyWith(color: greyTextColor),
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
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.location_on,
                                color: greyTextColor, size: 14.0),
                            Text(
                              model.location!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: greyTextColor),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: mainColor,
                              size: 14.0,
                            ),
                            Text(
                              model.rate.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: greyTextColor,
                                  ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: mainColor)),
                          child: Text(
                            'Popular',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: mainColor),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: mainColor)),
                          child: Text(
                            'New',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: mainColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
