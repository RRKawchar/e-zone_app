// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/core/utils/constants.dart';
import 'package:e_zone/view/main/main_screen.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentService {

  static Map<String, dynamic>? paymentIntent;
  static Future<void> makePayment(BuildContext context, double amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      displayPaymentSheet(context);
    } catch (err) {
      throw Exception(err);
    }
  }

  static createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $STRIPE_SCREET',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  static displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
          context: context,
          builder: (_) =>  AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100.0,
                ),
                const SizedBox(height: 10.0),
                const SizedBox(height: 10.0),
                const Text("Payment Successful!"),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green)
                  ),
                  child: InkWell(
                     onTap: (){
                       final carViewModel = Get.find<CartViewModel>();
                        carViewModel.removeAllCartItem();
                        Get.to(MainScreen());
                     },

                      child:  const Center(child: Text("Home",style: TextStyle(color:Colors.green,fontSize: 20),))),
                )
              ],
            ),

          ),

        );

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      kPrint('Error is:---> $e');
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      kPrint('$e');
    }
  }

  static calculateAmount(double amount) {
    final calculatedAmount = (amount * 100).toInt();
    return calculatedAmount.toString();
  }
}
