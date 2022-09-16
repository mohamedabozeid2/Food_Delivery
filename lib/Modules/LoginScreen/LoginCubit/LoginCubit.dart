import 'package:flutter_bloc/flutter_bloc.dart';
import 'LoginStates.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FoodLoginCubit extends Cubit<FoodLoginStates> {
  FoodLoginCubit() :super(FoodInitialState());

  static FoodLoginCubit get(context) => BlocProvider.of(context);

  void phoneAuthentication({
    required String phoneNumber,
  }) {
    FirebaseAuth.instance.verifyPhoneNumber(

        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential)
    {
      print(credential.smsCode);
    },
    verificationFailed: (FirebaseAuthException e){
    print('=>>>> ${e.message}');
    },
    codeSent: (String verificationId, int? resendToken) {},
    codeAutoRetrievalTimeout: (String verificationId) {});
  }

}