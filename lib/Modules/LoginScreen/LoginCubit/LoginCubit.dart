import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Network/Local/CacheHelper.dart';
import 'package:get/get.dart';
import '../../../Shared/Constants/Constants.dart';
import 'LoginStates.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FoodLoginCubit extends Cubit<FoodLoginStates> {
  FoodLoginCubit() : super(FoodInitialState());

  static FoodLoginCubit get(context) => BlocProvider.of(context);

  String? verificationCode;

  void sendPhoneAuthenticationCode({
    required String phoneNumber,
  }) async {
    emit(FoodSendPhoneAuthenticationLoadingState());
    await FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: '+20$phoneNumber}',
            verificationCompleted: (PhoneAuthCredential credential) async {
              print('completed');
              // await FirebaseAuth.instance.signInWithCredential(credential).then((value){
              //   print(value.credential!.providerId);
              //   print(value.credential!.signInMethod);
              //   print(value.credential!.token);
              //     print('user logged in');
              //   }
              // }).catchError((error){
              //   print('NEWWW ERROR ===> ${error.toString()}');
              // });
            },
            verificationFailed: (FirebaseAuthException e) {
              Get.snackbar('Food Delivery', '${e.message}');
            },
            codeSent: (String verificationId, int? resendToken) {
              verificationCode = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              verificationCode = verificationId;
            },
            timeout: const Duration(seconds: 60))
        .then((value) {
      emit(FoodSendPhoneAuthenticationSuccessState());
    }).catchError((error) {
      print('error in verify phone ===> ${error.toString()}');
      emit(FoodSendPhoneAuthenticationErrorState(error: error.toString()));
    });
  }

  void phoneAuthentication({required String pin}){
    emit(FoodVerifyPhoneLoadingState());
    FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationCode!, smsCode: pin))
        .then((value) {
      Get.snackbar('Food Delivery', 'Done',
          colorText: Colors.white, backgroundColor: Colors.green);
      loggedIn = true;
      CacheHelper.saveData(key: 'loggedIn', value: true);
      emit(FoodVerifyPhoneSuccessState());
    }).catchError((error) {
      print(error.toString());
      Get.snackbar('Food Delivery', 'Wrong Code',
          backgroundColor: Colors.red, colorText: Colors.white);
      emit(FoodVerifyPhoneErrorState(error: error.toString()));

    });
  }
}
