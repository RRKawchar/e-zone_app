import 'package:e_zone/core/utils/app_color.dart';
import 'package:e_zone/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';

class CategoryTabBarWidget extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;
  const CategoryTabBarWidget({
    Key? key,
    required this.categoriesViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      isScrollable: true,
      tabs: categoriesViewModel.categories
          .map(
            (category) => Container(
              width: 140,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primaryColor,
              ),
              child: Tab(text: category),
            ),
          )
          .toList(),
    );
  }
}
