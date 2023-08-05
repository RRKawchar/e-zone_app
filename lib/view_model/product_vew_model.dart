import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../core/network/api_endpoint.dart';
import '../core/network/api_service.dart';
import '../core/res/helper/helper_method.dart';

class ProductViewModel extends GetxController {
  var isLoading = false.obs;

  Rx<File?> imageFile = Rx<File?>(null);
  var formKey = GlobalKey<FormState>().obs;

  final titleController = TextEditingController().obs;
  final priceController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  final categoryController = TextEditingController().obs;

  Future<void> pickImage() async {
    try {
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickImage != null) {
        imageFile.value = File(pickImage.path);
      }
    } catch (e) {
      kPrint(e.toString());
    }
  }

  Future<void> addProduct() async {
    try {
      if (imageFile.value == null) {
        kPrint("Please pick an image first!!");
        Get.snackbar('', 'Please pick an image first!!');
        return;
      }

      Map<String, dynamic> body = {
        'title': titleController.value.text,
        'price': priceController.value.text,
        'description': descriptionController.value.text,
        'image': imageFile.toString(),
        'category': descriptionController.value.text
      };

      isLoading(true);
      await ApiService.handleResponse(await ApiService.postRequest(
          url: ApiEndpoint.addProductApi, body: body));
      kPrint("My Body $body");
    } catch (e) {
      isLoading(false);
      kPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  String? titleValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is Required.';
    }
    return null;
  }

  String? priceValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Price is Required.";
    }
    double? price = double.tryParse(value);

    if (price == null || price <= 0) {
      return "Invalid Price. Please enter a valid number.";
    }
    return null;
  }

  String? categoryValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Category is Required.";
    }
    return null;
  }

  String? descriptionValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Description is Required.";
    }
    return null;
  }
}
