import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:get/get.dart';

class CategoriesViewModel extends GetxController {
  var categories = <String>[].obs;
  var isLoading = false.obs;
  var electronicsList = <ProductModel>[].obs;
  var jeweleryList = <ProductModel>[].obs;
  var mensClothingList = <ProductModel>[].obs;
  var womenList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    electronicProduct('electronics');
    jeweleryProduct('jewelery');
    mensProduct("men's clothing");
    womenProduct("women's clothing");
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      dynamic responseBody = await ApiService.handleResponse(
          await ApiService.getRequest(url: ApiEndpoint.productsCategories));

      if (responseBody != null) {
        categories.addAll(responseBody.cast<String>());
      } else {
        isLoading(false);
        throw Exception('Failed to load categories from API');
      }
    } catch (e) {
      isLoading(false);
      kPrint('Error: $e');
    } finally {
      isLoading(false);
    }
  }


  void electronicProduct(String category) async {
    try {
      isLoading(true);

      dynamic responseBody = await ApiService.handleResponse(
          await ApiService.getRequest(
              url: ApiEndpoint.specificCategory(category)));

      if (responseBody != null) {
        electronicsList.value = [];
        for (var product in responseBody) {
          electronicsList.add(ProductModel.fromJson(product));
        }
      } else {
        isLoading(false);
        throw "Unable to load Data";
      }
    } catch (e) {
      isLoading(false);
      kPrint(e.toString());
      throw e.toString();
    } finally {
      isLoading(false);
    }
  }

  void jeweleryProduct(String category) async {
    try {
      isLoading(true);

      dynamic responseBody = await ApiService.handleResponse(
          await ApiService.getRequest(
              url: ApiEndpoint.specificCategory(category)));

      if (responseBody != null) {
        jeweleryList.value = [];
        for (var product in responseBody) {
          jeweleryList.add(ProductModel.fromJson(product));
        }
      } else {
        isLoading(false);
        throw "Unable to load Data";
      }
    } catch (e) {
      isLoading(false);
      kPrint(e.toString());
      throw e.toString();
    } finally {
      isLoading(false);
    }
  }

  void mensProduct(String category) async {
    try {
      isLoading(true);

      dynamic responseBody = await ApiService.handleResponse(
          await ApiService.getRequest(
              url: ApiEndpoint.specificCategory(category)));

      if (responseBody != null) {
        mensClothingList.value = [];
        for (var product in responseBody) {
          mensClothingList.add(ProductModel.fromJson(product));
        }
      } else {
        isLoading(false);
        throw "Unable to load Data";
      }
    } catch (e) {
      isLoading(false);
      kPrint(e.toString());
      throw e.toString();
    } finally {
      isLoading(false);
    }
  }

  void womenProduct(String category) async {
    try {
      isLoading(true);

      dynamic responseBody = await ApiService.handleResponse(
          await ApiService.getRequest(
              url: ApiEndpoint.specificCategory(category)));

      if (responseBody != null) {
        womenList.value = [];
        for (var product in responseBody) {
          womenList.add(ProductModel.fromJson(product));
        }
      } else {
        isLoading(false);
        throw "Unable to load Data";
      }
    } catch (e) {
      isLoading(false);
      kPrint(e.toString());
      throw e.toString();
    } finally {
      isLoading(false);
    }
  }


}
