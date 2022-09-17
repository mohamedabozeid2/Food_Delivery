import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:get/get.dart';
import '../../../Shared/Constants/Constants.dart';
import 'LoginStates.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FoodLoginCubit extends Cubit<FoodLoginStates> {
  FoodLoginCubit() : super(FoodInitialState());

  static FoodLoginCubit get(context) => BlocProvider.of(context);

  void phoneAuthentication({
    required String phoneNumber,
  }) async {
    emit(FoodVerifyPhoneLoadingState());
    await FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: '+20$phoneNumber}',
            verificationCompleted: (PhoneAuthCredential credential) async {
              print('completed');
              // await FirebaseAuth.instance.signInWithCredential(credential).then((value){
              //   print(value.credential!.providerId);
              //   print(value.credential!.signInMethod);
              //   print(value.credential!.token);
              //   if(value.user!=null){
              //     print('user logged in');
              //   }
              // }).catchError((error){
              //   print('NEWWW ERROR ===> ${error.toString()}');
              // });
            },

            verificationFailed: (FirebaseAuthException e) {
              showToast(msg: '${e.message}');
              print('=>>>> ${e.message}');
            },
            codeSent: (String verificationId, int? resendToken) {
              verificationCode = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              verificationCode = verificationId;
            },
            timeout: const Duration(seconds: 60))
        .then((value) {
      emit(FoodVerifyPhoneSuccessState());
    }).catchError((error) {
      print(verificationCode);
      print('error in verify phone ===> ${error.toString()}');
      emit(FoodVerifyPhoneErrorState(error: error.toString()));
    });
  }
}
