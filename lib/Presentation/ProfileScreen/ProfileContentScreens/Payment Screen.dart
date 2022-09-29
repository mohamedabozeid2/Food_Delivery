import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/Components/Components.dart';

class PaymentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileContentAppBar(context: context, title: 'Payment Method')
    );
  }
}
