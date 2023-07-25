import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:flutter/material.dart';

class SaleViewWidget extends StatelessWidget {
  const SaleViewWidget({Key? key}) : super(key: key);

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
          CustomText(
            text: 'View All',
            size: 18,
          ),
        ],
      ),
    );
  }
}
