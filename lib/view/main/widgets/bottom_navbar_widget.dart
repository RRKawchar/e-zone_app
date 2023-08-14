import 'package:e_zone/core/utils/app_color.dart';
import 'package:e_zone/view_model/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarWidget extends StatelessWidget {
  final MainViewModel mainViewModel;
  const BottomNavbarWidget({Key? key, required this.mainViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomNavigationBar(
          currentIndex: mainViewModel.selectedIndex.value,
          showUnselectedLabels: true,
          unselectedItemColor:AppColor.secondaryColor,
          selectedItemColor: AppColor.primaryColor,
          onTap: (value) {
            mainViewModel.onTapped(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                  size: 30,
                ),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                ),
                label: "Users"),
          ],
        );
      },
    );
  }
}
