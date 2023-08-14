import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/core/utils/app_color.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:flutter/material.dart';

class DetailsTextWidget extends StatelessWidget {
  final ProductModel productModel;
  const DetailsTextWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomText(
          text: "Product Name : \n${productModel.title ?? ""}",
          maxLines: 4,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text:
                "Stock : ${productModel.rating!.count ?? ""}"),
            Row(
              children: [
                CustomText(text: "Price : "),
                CustomText(
                  text: "\$${productModel.price ?? ""}",
                  color: AppColor.primaryColor,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          text:
          "Description : \n${productModel.description ?? ""}",
          maxLines: 20,
        ),
      ],
    );
  }
}
