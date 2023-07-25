import 'package:e_zone/view/home/widgets/home_card_items.dart';
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
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 4.0,
              mainAxisExtent: 350,
            ),
            itemBuilder: (BuildContext context, int index) {
              final productList=homeViewModel.productList[index];
              return HomeCardItems(productList: productList,);
            },
          );
        })
    );
  }
}
