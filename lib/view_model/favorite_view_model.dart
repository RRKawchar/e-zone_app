import 'dart:convert';
import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/model/cart_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteViewModel extends GetxController {
  var isLoading = false.obs;
  var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var favList = <CartModel>[].obs;

  @override
  void onInit() {
    getFavouriteProduct();
    super.onInit();
  }

  bool isFavoriteProduct(int productId) {
    return favList.any((element) => element.pid == productId);
  }

  Future<List<CartModel>> getFavouriteProduct() async {
    isLoading.value = true;
    favList.value = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favItem = prefs.getString('favorite');
    final List<dynamic> jsonData = jsonDecode(favItem ?? '[]');
    final favList_ =
        jsonData.map<CartModel>((item) => CartModel.fromJson(item)).toList();
    var favoriteItems = favList_.reversed;
    favList.addAll(favoriteItems);
    isLoading.value = false;

    return favList;
  }

  void saveFavoriteInLocal({
    required int pid,
    required String image,
    required String description,
    required double price,
    required String title,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<CartModel> favoriteList = [];
    favoriteList.addAll(await getFavouriteProduct());

    // bool isAvailable = false;
    //
    // for (var element in favoriteList) {
    //   if (element.pid == pid) {
    //     isAvailable = true;
    //   }
    // }
    bool isAvailable = favoriteList.any((element) => element.pid == pid);

    if (isAvailable) {
      kSnackBar(message: "Already Added To Favorite!");
    } else if (favoriteList.length >= 8) {
      favoriteList.removeLast();
      kSnackBar(message: "Can't add more than 8 items!!");
    } else {
      CartModel newFavouriteItem = CartModel(
        pid: pid,
        image: image,
        description: description,
        price: price,
        userId: 2,
        title: title,
        date: currentDate.toString(),
        products: [
          CartItem(productId: pid, quantity: 1),
        ],
      );

      favoriteList.add(newFavouriteItem);
      await preferences.setString(
          'favorite', jsonEncode(favoriteList.map((e) => e.toJson()).toList()));
    }

    getFavouriteProduct();
    kPrint(
        "Local Store Products ${preferences.getString('favorite').toString()}");
  }

  void removeCartItem(int index) async {
    try {
      for (int i = 0; i < favList.length; i++) {
        if (i == index) {
          favList.removeAt(i);
        }
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          "favorite", jsonEncode(favList.map((e) => e.toJson()).toList()));
      getFavouriteProduct();
    } catch (e) {
      kPrint(e.toString());
    }
  }
}
