abstract class FoodLoginStates{}

class FoodInitialState extends FoodLoginStates{}

class FoodVerifyPhoneLoadingState extends FoodLoginStates{}
class FoodVerifyPhoneSuccessState extends FoodLoginStates{}
class FoodVerifyPhoneErrorState extends FoodLoginStates{
  final String error;
  FoodVerifyPhoneErrorState({required this.error});
}