import 'package:e_zone/core/components/custom_network_image.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:e_zone/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsImageWidget extends StatelessWidget {
  final ProductModel productModel;
  final FavoriteViewModel favoriteViewModel;

  const DetailsImageWidget({
    super.key,
    required this.productModel,
    required this.favoriteViewModel,
  });

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
              image: productModel.image ?? "",
            ),
          ),
        ),
        Obx(
          () => IconButton(
            onPressed: () {
              favoriteViewModel.saveFavoriteInLocal(
                pid: productModel.id!.toInt(),
                image: productModel.image.toString(),
                description: productModel.description.toString(),
                price: productModel.price!.toDouble(),
                title: productModel.title.toString(),
              );
            },
            icon: Icon(
              favoriteViewModel.favList
                      .any((element) => element.pid == productModel.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
