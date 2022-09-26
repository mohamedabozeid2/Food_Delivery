abstract class FoodLayoutStates{}

class FoodLayoutInitialState extends FoodLayoutStates{}


class FoodLayoutChangeBotNavBarState extends FoodLayoutStates{}


class FoodLayoutChangeNavState extends FoodLayoutStates{}

class FoodLayoutShowMoreInfoState extends FoodLayoutStates{}

class FoodLayoutGetRestaurantsLoadingState extends FoodLayoutStates{}
class FoodLayoutGetRestaurantsSuccessState extends FoodLayoutStates{}
class FoodLayoutGetRestaurantsErrorState extends FoodLayoutStates{}

class FoodLayoutGetMealContentLoadingState extends FoodLayoutStates{}
class FoodLayoutGetMealContentSuccessState extends FoodLayoutStates{}
class FoodLayoutGetMealContentErrorState extends FoodLayoutStates{

}
class FoodLayoutAddFavoriteLoadingState extends FoodLayoutStates{}
class FoodLayoutAddFavoriteSuccessState extends FoodLayoutStates{}
class FoodLayoutAddFavoriteErrorState extends FoodLayoutStates{}