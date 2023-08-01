import 'package:e_zone/core/res/app_color/app_color.dart';
import 'package:e_zone/core/res/components/custom_button.dart';
import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: CustomText(
            text: widget.productModel.category ?? "",
            size: 30,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: Get.height / 2.4,
                        width: Get.width / 1.6,
                        color: Colors.black,
                        child: CustomNetworkImage(
                          image: widget.productModel.image ?? "",
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
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Product Name : \n${widget.productModel.title ?? ""}",
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
                            "Stock : ${widget.productModel.rating!.count ?? ""}"),
                    Row(
                      children: [
                        CustomText(text: "Price : "),
                        CustomText(
                          text: "\$${widget.productModel.price ?? ""}",
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
                      "Description : \n${widget.productModel.description ?? ""}",
                  maxLines: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
          text: "Add To Cart",
          onTap: () {},
        ));
  }
}
