import 'package:e_zone/view/categories/categories_screen.dart';
import 'package:e_zone/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController{

  List<Widget> pages=[
     HomeScreen(),
     CategoriesTabBar(),
    const Text("Favorite"),
    const Text("Users")
  ];


  RxInt selectedIndex=0.obs;

  void onTapped(int index){
    selectedIndex.value=index;
  }

}