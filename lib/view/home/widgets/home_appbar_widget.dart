import 'package:e_zone/core/res/constants/constants.dart';
import 'package:e_zone/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeAppbarWidget({Key? key, required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Drawer button
        SizedBox(
          height: 50,
          width: 50,
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
        ),
        const SizedBox(width: 70),


        /// App Logo
        SizedBox(
          height: 50,
          width: 100,
          child: Image.asset(
            appLogo,fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 60),

        /// Search Button
        SizedBox(
          height: 50,
          width: 40,
          child: IconButton(
              onPressed: () {
                Get.to(SearchScreen());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
        ),

        /// Shopping Cart Icon Button
        SizedBox(
          height: 45,
          width: 45,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_checkout_rounded,
                size: 30,
              )),
        ),
      ],
    );
  }
}
