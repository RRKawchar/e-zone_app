import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/view/cart_screen/cart_screen.dart';
import 'package:e_zone/view/favorite/widgets/single_fav_item.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:e_zone/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final favoriteViewModel = Get.find<FavoriteViewModel>();
  final cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Obx(
          () {
            if (favoriteViewModel.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: favoriteViewModel.favList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 4.0,
                mainAxisExtent: 350,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SingleFavItem(
                  favoriteViewModel: favoriteViewModel,
                  index: index,
                  cartViewModel: cartViewModel,
                );
              },
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: CustomText(
        text: "Favorite Items",
        size: 20,
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Get.to(const CartScreen());
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
            ))
      ],
    );
  }
}
