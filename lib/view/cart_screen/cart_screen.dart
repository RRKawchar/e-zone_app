import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/view/cart_screen/widgets/cart_button_total_price_widget.dart';
import 'package:e_zone/view/cart_screen/widgets/cart_item_widget.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// AppBar .....................

        appBar: _buildAppBar(),


        body: Obx(
          () {
            if (cartViewModel.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CartItemWidget(cartViewModel: cartViewModel);
          },
        ),
        bottomNavigationBar: CartButtonTotalPriceWidget(
          cartViewModel: cartViewModel,
        ));
  }

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
        text: "Cart Product",
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
