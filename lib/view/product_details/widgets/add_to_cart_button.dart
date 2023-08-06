import 'package:e_zone/core/res/components/custom_button.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  final CartViewModel cartViewModel;
  final ProductModel productModel;
  const AddToCartButton({super.key, required this.cartViewModel, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return  Obx(
          () => CustomButton(
        text: cartViewModel.isProductAdded(productModel.id!)
            ? "Already Added"
            : "Add To Cart",
        onTap: () {
          if (!cartViewModel.isProductAdded(productModel.id!)) {
            cartViewModel.saveCartItemInLocal(
              pid: productModel.id!,
              image: productModel.image!,
              description: productModel.description!,
              price: productModel.price!,
              title: productModel.title!,
            );
          } else {
            kSnackBar(message: 'Already add to cart');
          }
        },
      ),
    );
  }
}
