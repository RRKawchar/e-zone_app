import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleViewWidget extends StatelessWidget {
  SaleViewWidget({Key? key}) : super(key: key);

  final homeViewModel = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Super Sale',
            size: 27,
            fontWeight: FontWeight.bold,
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 40,
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  value: homeViewModel.selectedSort.value,
                  onChanged: (value) {
                    homeViewModel.updateSelectedSort(value);
                  },
                  items: ['asc', 'desc'].map((sort) {
                    return DropdownMenuItem<String>(
                      value: sort,
                      child: Text(sort),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
