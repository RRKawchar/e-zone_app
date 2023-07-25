import 'package:e_zone/core/res/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeAppbarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeAppbarWidget({Key? key, required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 80,
          child: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        const SizedBox(width: 60),
        SizedBox(
            height: 50,
            width: 100,
            child: Image.asset(
              appLogo,
            )),
        const SizedBox(width: 60),
        SizedBox(
          height: 50,
          width: 80,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
        ),
      ],
    );
  }
}
