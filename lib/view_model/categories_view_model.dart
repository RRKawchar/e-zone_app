import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:get/get.dart';


class CategoriesViewModel extends GetxController {
  var categories = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
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
}
