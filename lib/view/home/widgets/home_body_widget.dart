import 'package:e_zone/core/res/components/single_card_items.dart';
import 'package:e_zone/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBodyWidget extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const HomeBodyWidget({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Obx((){
          if(homeViewModel.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            itemCount: homeViewModel.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 4.0,
              mainAxisExtent: 350,
            ),
            itemBuilder: (BuildContext context, int index) {
              final productList=homeViewModel.productList[index];
              return SingleCardItems(productList: productList,);
            },
          );
        })
    );
  }
}
