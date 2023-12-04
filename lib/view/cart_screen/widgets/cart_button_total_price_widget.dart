import 'dart:convert';

import 'package:e_zone/core/components/custom_button.dart';
import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/core/services/payment_service.dart';
import 'package:e_zone/core/utils/constants.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class CartButtonTotalPriceWidget extends StatefulWidget {
  final CartViewModel cartViewModel;
  const CartButtonTotalPriceWidget({super.key, required this.cartViewModel});

  @override
  State<CartButtonTotalPriceWidget> createState() => _CartButtonTotalPriceWidgetState();
}

class _CartButtonTotalPriceWidgetState extends State<CartButtonTotalPriceWidget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Obx(
                () => CustomText(
              text:
              "Total : \$${widget.cartViewModel.calculateTotalPrice().toStringAsFixed(1)}",
              size: 18,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: CustomButton(
                onTap: () {
                  double totalPrice = widget.cartViewModel.calculateTotalPrice();
                  PaymentService.makePayment(context, totalPrice);
                },
                text: 'Checkout',
                isResponsive: true,
              )),
        ],
      ),
    );
  }

}
