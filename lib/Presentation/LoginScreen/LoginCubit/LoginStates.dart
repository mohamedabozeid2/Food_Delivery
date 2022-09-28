abstract class FoodLoginStates{}

class FoodInitialState extends FoodLoginStates{}

class FoodSendPhoneAuthenticationLoadingState extends FoodLoginStates{}
class FoodSendPhoneAuthenticationSuccessState extends FoodLoginStates{}
class FoodSendPhoneAuthenticationErrorState extends FoodLoginStates{
  final String error;
  FoodSendPhoneAuthenticationErrorState({required this.error});
}


class FoodLayoutGetUserDataLoadingState extends FoodLoginStates{}
class FoodLayoutGetUserDataSuccessState extends FoodLoginStates{}
class FoodLayoutGetUserDataErrorState extends FoodLoginStates{}


class FoodVerifyPhoneLoadingState extends FoodLoginStates{}
class FoodVerifyPhoneSuccessState extends FoodLoginStates{}
class FoodVerifyPhoneErrorState extends FoodLoginStates{
  final String error;
  FoodVerifyPhoneErrorState({required this.error});
}