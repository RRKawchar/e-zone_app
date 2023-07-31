import 'package:e_zone/core/res/components/single_card_items.dart';
import 'package:e_zone/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MensClothWidget extends StatelessWidget {
  MensClothWidget({Key? key}) : super(key: key);

  final categoryViewModel = Get.find<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 10),
      itemCount: categoryViewModel.mensClothingList.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 4.0,
        mainAxisExtent: 350,
      ),
      itemBuilder: (BuildContext context, int index) {
        final productList =
        categoryViewModel.mensClothingList[index];
        return SingleCardItems(
          productList: productList,
        );
      },
    );
  }
}
