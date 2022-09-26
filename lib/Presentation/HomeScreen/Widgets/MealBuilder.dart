import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/LoginScreen/LoginCubit/LoginStates.dart';

import '../../../DataModels/MealModel.dart';
import '../../../Shared/Components/Components.dart';
import '../../../Shared/styles/Themes.dart';
import '../../../utils/helper.dart';
import '../../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import '../MealDetails.dart';

class MealBuilder extends StatelessWidget {
  List<MealModel> model;
  int index;
  int restaurantIndex;

  MealBuilder({
    required this.model,
    required this.index,
    required this.restaurantIndex,
});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state){},
      builder: (context, state){
        return GestureDetector(
          onTap: () {
            navigateTo(
                context,
                MealDetails(
                  model: model[index],
                  index: index,
                  restaurantIndex: restaurantIndex,
                  restaurantId: FoodLayoutCubit.get(context)
                      .restaurantId[restaurantIndex],
                ));
          },
          child: Material(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Image.network(
                        width: Helper.getScreenWidth(context: context) * 0.37,
                        '${model[index].image}'),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Helper.getScreenWidth(context: context) * 0.3,
                        child: Text(
                          '${model[index].name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'EGP ${model[index].mediumSizePrice}',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                      width: Helper.getScreenWidth(context: context) * 0.1,
                      child:/* state is FoodLayoutAddFavoriteLoadingState ? Center(child: CircularProgressIndicator(color: mainColor,)) : */favoriteButton(
                          iconColor: FoodLayoutCubit.get(context).favID.contains(model[index].id)? mainColor : greyTextColor,
                          fun: () {
                            FoodLayoutCubit.get(context)
                                .addOrRemoveFavorite(mealModel: model[index]);
                          }))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
