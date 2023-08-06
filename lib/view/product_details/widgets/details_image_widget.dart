import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsImageWidget extends StatelessWidget {
  final ProductModel productModel;
  const DetailsImageWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: Get.height / 2.4,
            width: Get.width / 1.6,
            color: Colors.black,
            child: CustomNetworkImage(
              image:productModel.image ?? "",
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ))
      ],
    );
  }
}
