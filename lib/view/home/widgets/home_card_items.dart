// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/view/home/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCardItems extends StatelessWidget {
 final productList;
  const HomeCardItems({Key? key, this.productList,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height:240,
              width: Get.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomNetworkImage(image:productList.image.toString()),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: StarRatingWidget(rating: productList.rating!.rate),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomText(
              text:productList.title.toString(),maxLines: 2,fontWeight: FontWeight.bold,
              size: 18,
            ),
          ),
          const SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomText(text:"\$${productList.price}",size: 18,color: Colors.red,),
          ),
        ],
      ),
    );
  }

}
