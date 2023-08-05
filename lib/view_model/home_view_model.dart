import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var isLoading = false.obs;
  var productList = <ProductModel>[].obs;
  var selectedSort = 'asc'.obs;

  Map<String, dynamic> body = {
    'title': 'test product',
    'price': 13.5,
    'description': 'lorem ipsum set',
    'image':
        'https://w7.pngwing.com/pngs/724/729/png-transparent-calculator-calculator-electronics-calculator-technology-thumbnail.png',
    'category': 'electronic'
  };

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      dynamic responseBody = await ApiService.handleResponse(
        await ApiService.getRequest(
          url: ApiEndpoint.sortProductApi(selectedSort.value),
        ),
      );

      if (responseBody != null) {
        productList.value = [];
        for (var product in responseBody) {
          productList.add(ProductModel.fromJson(product));
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

  void updateSelectedSort(String? value) {
    if (value != null) {
      selectedSort.value = value;
      fetchProduct();
    }
  }
}
