import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var isLoading = false.obs;
  var productList = <ProductModel>[].obs;
  var selectedSort = 'asc'.obs;

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

  void updateSelectedLimit(String? value) {
    if (value != null) {
      selectedSort.value = value;
      fetchProduct();
    }
  }


  void addProduct({required var body})async{
     try{
       isLoading(true);
       await ApiService.handleResponse(
           await ApiService.postRequest(url: ApiEndpoint.addProductApi, body: body)
       );
     }catch(e){
       isLoading(false);
       kPrint(e.toString());
     }finally{
       isLoading(false);
     }



  }
}
