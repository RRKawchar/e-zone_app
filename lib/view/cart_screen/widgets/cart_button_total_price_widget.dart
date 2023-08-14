import 'package:e_zone/core/components/custom_button.dart';
import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartButtonTotalPriceWidget extends StatelessWidget {
  final CartViewModel cartViewModel;
  const CartButtonTotalPriceWidget({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Obx(
                () => CustomText(
              text:
              "Total : \$${cartViewModel.calculateTotalPrice().toStringAsFixed(1)}",
              size: 18,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: CustomButton(
                onTap: () {},
                text: 'Checkout',
                isResponsive: true,
              )),
        ],
      ),
    );
  }
}
