import 'package:e_zone/core/res/routes/routes_name.dart';
import 'package:e_zone/view/main/main_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.mainScreen,
            page: () => MainScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250))
      ];
}
