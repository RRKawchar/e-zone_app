import 'package:e_zone/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesTabBar extends StatelessWidget {
  final categoryViewModel = Get.find<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => categoryViewModel.categories.isNotEmpty
            ? DefaultTabController(
                length: categoryViewModel.categories.length,
                child: Scaffold(

                  body: Column(
                    children: [
                      const SizedBox(height: 30,),
                      TabBar(
                        isScrollable: true,
                        tabs: categoryViewModel.categories
                            .map((category) => Container(
                           color: Colors.black,
                            width: 150,
                            child: Tab(text: category)))
                            .toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: categoryViewModel.categories
                              .map(
                                (category) => buildCategoryScreen(category),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget buildCategoryScreen(String category) {
    return Center(
      child: Text('Displaying products for $category'),
    );
  }
}
