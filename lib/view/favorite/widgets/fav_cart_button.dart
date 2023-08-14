import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavCartButton extends StatelessWidget {
  final CartViewModel cartViewModel;
  final favList;
  const FavCartButton({super.key, required this.cartViewModel, this.favList});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 22,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Center(
            child: Obx(
                  () => IconButton(
                onPressed: () {
                  if (!cartViewModel.isProductAdded(favList.pid!)) {
                    cartViewModel.saveCartItemInLocal(
                      pid: favList.pid!,
                      image: favList.image!,
                      description: favList.description!,
                      price: favList.price!,
                      title: favList.title!,
                    );
                  } else {
                    kSnackBar(message: 'Already add to cart');
                  }
                },
                icon: Icon(
                  cartViewModel.isProductAdded(favList.pid!)
                      ? Icons.shopping_cart
                      : Icons.add_shopping_cart_outlined,
                ),
              ),
            )),
      ),
    );
  }
}
