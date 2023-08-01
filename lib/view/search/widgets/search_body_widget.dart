import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/core/res/components/single_card_items.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBodyWidget extends StatelessWidget {
  final SearchViewModel searchViewModel;
  const SearchBodyWidget({Key? key, required this.searchViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Obx(
            () {
          if (searchViewModel.isLoading.value) {
            return kCircularProgressIndicator();
          } else if (searchViewModel
              .limitController.value.text.isNotEmpty) {
            if (searchViewModel.limitProduct.isEmpty) {
              return Center(
                child: CustomText(
                  text:
                  "No found ${searchViewModel.limitController.value.text} product",
                ),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                itemCount: searchViewModel.limitProduct.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 350,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final productList =
                  searchViewModel.limitProduct[index];
                  return SingleCardItems(
                    productList: productList,
                  );
                },
              );
            }
          } else {
            if (searchViewModel.idController.value.text.isEmpty) {
              return Container();
            } else if (searchViewModel.searchList.isEmpty) {
              return Center(
                child: CustomText(
                  text:
                  "No Found ${searchViewModel.idController.value.text} number product",
                ),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                itemCount: searchViewModel.searchList.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 350,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final productList = searchViewModel.searchList[index];
                  return SingleCardItems(
                    productList: productList,
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
