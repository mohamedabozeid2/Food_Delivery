import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  final String authenticationCode;

  PinputWidget({required this.authenticationCode});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      length: 6,
      onCompleted: (pin) {
        if(pin == authenticationCode){
          print('Yes Bro wtf');
        }else{
          Get.snackbar('Food Delivery', 'You verification code is incorrect', colorText: Colors.white,
          backgroundColor: Colors.redAccent);
        }
      },
    );
  }
}
