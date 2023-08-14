import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:e_zone/view_model/categories_view_model.dart';
import 'package:e_zone/view_model/favorite_view_model.dart';
import 'package:e_zone/view_model/home_view_model.dart';
import 'package:e_zone/view_model/main_view_model.dart';
import 'package:e_zone/view_model/product_vew_model.dart';
import 'package:e_zone/view_model/search_view_model.dart';
import 'package:e_zone/view_model/user_view_model.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => CategoriesViewModel(), fenix: true);
    Get.lazyPut(() => SearchViewModel(), fenix: true);
    Get.lazyPut(() => ProductViewModel(), fenix: true);
    Get.lazyPut(() => CartViewModel(), fenix: true);
    Get.lazyPut(() => FavoriteViewModel(), fenix: true);
    Get.lazyPut(() => UserViewModel(), fenix: true);
  }
}
