import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/view_model/product_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickImageButtonWidget extends StatelessWidget {
  final ProductViewModel productViewModel;
  final Rx<String> imagePath;
  const PickImageButtonWidget({
    super.key,
    required this.productViewModel,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        await productViewModel.pickImage();
        if (productViewModel.imageFile.value != null) {
          imagePath.value = productViewModel.imageFile.value!.path;
        }
      },
      icon: const Icon(Icons.upload),
      label: CustomText(
        text: "PickImage",
      ),
    );
  }
}
