import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  var isLoading = false.obs;
  var limitProduct = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;

  final limitController = TextEditingController().obs;
  final idController = TextEditingController().obs;
  final limitFocus = FocusNode().obs;
  final idFocus = FocusNode().obs;

  @override
  void onClose() {
    limitController.value.dispose();
    idController.value.dispose();
    limitFocus.value.dispose();
    idFocus.value.dispose();
    super.onClose();
  }

  void fetchLimitProduct(String limit) async {
    try {
      isLoading(true);
      dynamic responseBody =
          await ApiService.handleResponse(await ApiService.getRequest(
        url: ApiEndpoint.limitProductApi(limit),
      ));

      if (responseBody != null) {
        limitProduct.value = [];
        for (var limit in responseBody) {
          limitProduct.add(ProductModel.fromJson(limit));
        }
      } else {
        isLoading(false);
        throw Exception("Unable to load data");
      }
    } catch (e) {
      isLoading(false);
      kPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchSearchProduct(int id) async {
    try {
      isLoading(true);
      dynamic responseBody = await ApiService.handleResponse(
          await ApiService.getRequest(url: ApiEndpoint.searchByProductId(id)));

      if (responseBody != null) {
        searchList.value = [];
        searchList.add(ProductModel.fromJson(responseBody));
      } else {
        isLoading(false);
        throw Exception("Unable to load data");
      }
    } catch (e) {
      isLoading(false);
      kPrint("MyError ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
