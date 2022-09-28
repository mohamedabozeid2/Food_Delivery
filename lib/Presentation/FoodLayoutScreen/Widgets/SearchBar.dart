import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: textFormFieldWithHint(
          context: context,
          controller: searchController,
          label: 'search'.tr,
          borderRadius: 20.0,
          prefixIcon: const Icon(Icons.search),

          type: TextInputType.text),
    );
  }
}
