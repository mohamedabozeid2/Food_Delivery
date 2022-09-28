import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/Components/Components.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileContentAppBar(context: context, title: 'Invite & Share')
    );
  }
}
