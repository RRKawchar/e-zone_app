import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatelessWidget {
  final CartViewModel cartViewModel;
  const CartItemWidget({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartViewModel.cartList.length,
        itemBuilder: (context, index) {
          final cartItem = cartViewModel.cartList[index];

          return Card(
            child: ListTile(
              leading: SizedBox(
                height: 100,
                width: 60,
                child: CustomNetworkImage(
                  image: cartItem.image.toString(),
                ),
              ),
              title: CustomText(
                text: cartItem.title.toString(),
              ),
              subtitle: CustomText(
                text: "\$${cartItem.price!.toStringAsFixed(1)}",
                size: 20,
                color: Colors.red,
              ),

              /// here i need delete product from cart list................

              trailing: IconButton(onPressed: () {
                cartViewModel.removeCartItem(index);
              }, icon: Obx(() {
                if (cartViewModel.isDeleting[index] ?? false) {
                  return kCircularProgressIndicator();
                } else {
                  return const Icon(
                    Icons.delete,
                    size: 22,
                  );
                }
              })),
            ),
          );
        });
  }
}
