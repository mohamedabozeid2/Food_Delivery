import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Network/Local/CacheHelper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen', style: TextStyle(
          color: Colors.red
        ),),
      ),
      body: Column(
        children: [
            defaultButton(text: 'test', fun: (){
              print(CacheHelper.getData(key: 'uId'));
            })
        ],
      ),
    );
  }
}
