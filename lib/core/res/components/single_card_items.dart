// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:e_zone/view/home/widgets/rating_widget.dart';
import 'package:e_zone/view/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCardItems extends StatelessWidget {
  final ProductModel productList;
  const SingleCardItems({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(ProductDetailsScreen(productModel: productList));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 220,
              width: Get.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomNetworkImage(
                image: productList.image.toString(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: StarRatingWidget(rating: productList.rating!.rate),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomText(
              text: productList.title.toString(),
              maxLines: 2,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$${productList.price}",
                  size: 18,
                  color: Colors.red,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 22,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 22,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
