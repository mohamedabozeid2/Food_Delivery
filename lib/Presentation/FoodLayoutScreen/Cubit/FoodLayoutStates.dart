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

class FoodLayoutUpdateUserDataLoadingState extends FoodLayoutStates{}
class FoodLayoutUpdateUserDataSuccessState extends FoodLayoutStates{}
class FoodLayoutUpdateUserDataErrorState extends FoodLayoutStates{}

class FoodLayoutAddFavoriteLoadingState extends FoodLayoutStates{}
class FoodLayoutAddFavoriteSuccessState extends FoodLayoutStates{}
class FoodLayoutAddFavoriteErrorState extends FoodLayoutStates{}


class FoodCalcPriceState extends FoodLayoutStates{}

class FoodSendPhoneAuthenticationLoadingState extends FoodLayoutStates{}
class FoodSendPhoneAuthenticationSuccessState extends FoodLayoutStates{}
class FoodSendPhoneAuthenticationErrorState extends FoodLayoutStates{
  final String error;
  FoodSendPhoneAuthenticationErrorState({required this.error});
}


class FoodLayoutGetUserDataLoadingState extends FoodLayoutStates{}
class FoodLayoutGetUserDataSuccessState extends FoodLayoutStates{}
class FoodLayoutGetUserDataErrorState extends FoodLayoutStates{}




class FoodVerifyPhoneLoadingState extends FoodLayoutStates{}
class FoodVerifyPhoneSuccessState extends FoodLayoutStates{}
class FoodVerifyPhoneErrorState extends FoodLayoutStates{
  final String error;
  FoodVerifyPhoneErrorState({required this.error});
}