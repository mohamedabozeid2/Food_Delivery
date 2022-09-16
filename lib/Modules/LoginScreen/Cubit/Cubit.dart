import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Modules/LoginScreen/Cubit/States.dart';

class FoodLoginCubit extends Cubit<FoodLoginStates>{
  FoodLoginCubit():super(FoodInitialState());

  static FoodLoginCubit get(context) => BlocProvider.of(context);

}