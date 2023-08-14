import 'dart:io';
import 'package:e_zone/core/components/custom_network_image.dart';
import 'package:e_zone/view_model/product_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreenImageWidget extends StatelessWidget {
  final Rx<String> imagePath;
  final ProductViewModel productViewModel;
  const AddScreenImageWidget(
      {super.key, required this.imagePath, required this.productViewModel});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 200,
        width: 180,
        child: imagePath.isNotEmpty
            ? imagePath.startsWith('http')
                ? CustomNetworkImage(
                    image: imagePath.value,
                  )
                : Image.file(
                    File(imagePath.value),
                    fit: BoxFit.fill,
                  )
            : productViewModel.imageFile.value != null
                ? Image.file(
                    productViewModel.imageFile.value!,
                    fit: BoxFit.fill,
                  )
                : const Icon(
                    Icons.image,
                    size: 100,
                  ),
      ),
    );
  }
}
