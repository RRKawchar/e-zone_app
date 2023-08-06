// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:e_zone/view/add_product/product_add_screen.dart';
import 'package:e_zone/view/home/widgets/rating_widget.dart';
import 'package:e_zone/view/product_details/product_details_screen.dart';
import 'package:e_zone/view_model/home_view_model.dart';
import 'package:e_zone/view_model/product_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCardItems extends StatelessWidget {
  final ProductModel productList;
   SingleCardItems({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final productViewModel=Get.find<ProductViewModel>();
  final homeViewModel=Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(
                ProductDetailsScreen(
                  productModel: productList,
                ),
              );
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
                    onPressed: () {
                      Get.to(
                        ProductAddScreen(
                          id: productList.id,
                          title: productList.title,
                          price: productList.price.toString(),
                          category: productList.category,
                          description: productList.description,
                          image: productList.image,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 22,
                    )),

                IconButton(
                  onPressed: () async{
                    await productViewModel.deleteProduct(id: productList.id!);

                  },
                  icon: Obx((){
                    if(productViewModel.isDeleting[productList.id]??false){
                      return kCircularProgressIndicator();
                    }else{
                      return const Icon(
                        Icons.delete,
                        size: 22,
                      );
                    }
                  })
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
