import 'dart:convert';
import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/model/cart_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewModel extends GetxController {
  var isLoading = false.obs;
  var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var isDeleting = <int, bool>{}.obs;
  var isLike = false.obs;
  var cartList = <CartModel>[].obs;

  @override
  void onInit() {
    getFavouriteProduct();
    super.onInit();
  }

  Future<void> addToCart({required int pId}) async {
    var cartModel = CartModel(
      userId: 1,
      date: currentDate.toString(),
      products: [
        CartItem(
          productId: pId,
          quantity: 2,
        )
      ],
    );
    try {
      isLoading.value = true;

      await ApiService.handleResponse(
        await ApiService.postRequest(
          url: ApiEndpoint.cartAddApi,
          body: cartModel.toJson(),
        ),
      );
    } catch (e) {
      kPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CartModel>> getFavouriteProduct() async {
    isLoading.value = true;
    cartList.value = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartItem = prefs.getString('cartItems');
    final List<dynamic> jsonData = jsonDecode(cartItem ?? '[]');
    final cartList_ =
        jsonData.map<CartModel>((item) => CartModel.fromJson(item)).toList();
    var cartItems = cartList_.reversed;
    cartList.addAll(cartItems);
    isLoading.value = false;

    return cartList;
  }

  /// Store cart product in Local DB

  void saveCartItemInLocal(
      {required int pid,
      required String image,
      required String description,
      required double price,
      required String title}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<CartModel> cartList = [];
    cartList.addAll(await getFavouriteProduct());

    bool isAvailable = false;

    for (var element in cartList) {
      if (element.pid == pid) {
        isAvailable = true;
      }
    }

    if (isAvailable) {
      kSnackBar(message: "Already added to cart!!");
    } else if (cartList.length >= 8) {
      cartList.removeLast();
      kSnackBar(message: "Cart is full! Please some cart item delete!!");
    } else {
      addToCart(pId: pid);
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

      cartList.add(newFavouriteItem);
      await preferences.setString(
          'cartItems', jsonEncode(cartList.map((e) => e.toJson()).toList()));
    }

    getFavouriteProduct();
    kPrint(
        "Local Store Products ${preferences.getString('cartItems').toString()}");
  }

  /// Check Cart Added Product...............................

  bool isProductAdded(int productId) {
    return cartList.any((element) => element.pid == productId);
  }

  /// Deleting Loading Check ................................

  void setLoading(int id, bool value) {
    isDeleting[id] = value;
  }

  /// Remove Cart Item..................................

  void removeCartItem(int index) async {
    try {
      setLoading(index, true);
      for (int i = 0; i < cartList.length; i++) {
        if (i == index) {
          cartList.removeAt(i);
        }
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          "cartItems", jsonEncode(cartList.map((e) => e.toJson()).toList()));
      getFavouriteProduct();
    } catch (e) {
      kPrint(e.toString());
    } finally {
      setLoading(index, false);
    }
  }

  /// Total Cart Price......................

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var element in cartList) {
      totalPrice += (element.price! * element.products.first.quantity);
    }
    return totalPrice;
  }
}
