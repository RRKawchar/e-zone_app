import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:e_zone/view/product_details/widgets/add_to_cart_button.dart';
import 'package:e_zone/view/product_details/widgets/details_image_widget.dart';
import 'package:e_zone/view/product_details/widgets/details_texts_widget.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
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
  final cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Here image and favorite icon button...............

                DetailsImageWidget(productModel: widget.productModel),

                const SizedBox(
                  height: 10,
                ),

                /// Here Title, stock , price and description text widget.........................

                DetailsTextWidget(productModel: widget.productModel),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddToCartButton(
          cartViewModel: cartViewModel,
          productModel: widget.productModel,
        ));
  }

  /// Custom Appbar........................

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }
}
