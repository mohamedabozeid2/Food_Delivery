import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileContentAppBar(context: context, title: 'payment_method'.tr)
    );
  }
}
