import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/core/network/api_endpoint.dart';
import 'package:e_zone/core/network/api_service.dart';
import 'package:e_zone/model/user_model.dart';
import 'package:get/get.dart';

class UserViewModel extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
  getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    try {
      isLoading(true);
      dynamic responseBody = await ApiService.handleResponse(
        await ApiService.getRequest(url: ApiEndpoint.allUsers),
      );
      if (responseBody != null) {
        for (var user in responseBody) {
          userList.add(UserModel.fromJson(user));
        }
      }
    } catch (e) {
      kPrint(e.toString());
      throw Exception(e.toString());
    }finally{
      isLoading(false);
    }
  }
}
