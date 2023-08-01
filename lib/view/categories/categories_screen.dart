import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/view/categories/widgets/category_tabbar_widget.dart';
import 'package:e_zone/view/categories/widgets/electronics_widget.dart';
import 'package:e_zone/view/categories/widgets/jewelery_widget.dart';
import 'package:e_zone/view/categories/widgets/mens_cloth_widget.dart';
import 'package:e_zone/view/categories/widgets/women_cloth_widget.dart';
import 'package:e_zone/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoryViewModel = Get.find<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (categoryViewModel.isLoading.value) {
            return kCircularProgressIndicator();
          } else if (categoryViewModel.electronicsList.isEmpty) {
            return kCircularProgressIndicator();
          } else if (categoryViewModel.jeweleryList.isEmpty) {
            return kCircularProgressIndicator();
          } else if (categoryViewModel.mensClothingList.isEmpty) {
            return kCircularProgressIndicator();
          } else if (categoryViewModel.womenList.isEmpty) {
            return kCircularProgressIndicator();
          } else {
            return DefaultTabController(
              length: categoryViewModel.categories.length,
              child: Scaffold(
                body: Column(
                  children: [
                    const SizedBox(height: 35),

                    /// here TabBar
                    CategoryTabBarWidget(
                      categoriesViewModel: categoryViewModel,
                    ),

                    const SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ElectronicsWidget(),
                          JeweleryWidget(),
                          MensClothWidget(),
                          WomenClothWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
