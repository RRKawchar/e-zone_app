import 'dart:io';

import 'package:e_zone/core/res/components/custom_button.dart';
import 'package:e_zone/core/res/components/custom_network_image.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/view/add_product/widgets/add_screen_image_widget.dart';
import 'package:e_zone/view/add_product/widgets/form_widget.dart';
import 'package:e_zone/view/add_product/widgets/pickImage_button_widget.dart';
import 'package:e_zone/view_model/product_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen(
      {super.key,
      this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image});
  final int? id;
  final String? title;
  final String? price;
  final String? category;
  final String? description;
  final String? image;
  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final productViewModel = Get.find<ProductViewModel>();
  final RxString _imagePath = RxString('');

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() {
    productViewModel.titleController.value.text = widget.title.toString();
    productViewModel.priceController.value.text = widget.price.toString();
    productViewModel.categoryController.value.text = widget.category.toString();
    productViewModel.descriptionController.value.text =
        widget.description.toString();
    _imagePath.value = widget.image ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Here image ..................

                AddScreenImageWidget(
                  imagePath: _imagePath,
                  productViewModel: productViewModel,
                ),

                /// PickImage button with icon..............

                PickImageButtonWidget(
                  productViewModel: productViewModel,
                  imagePath: _imagePath,
                ),

                const SizedBox(
                  height: 10,
                ),

                /// Form and TextFormField.........................

                FormWidget(
                    productViewModel: productViewModel,
                    title: widget.title,
                    price: widget.price,
                    category: widget.category,
                    description: widget.description,
                    id: widget.id),
                const SizedBox(
                  height: 20,
                ),

                /// Here Add and Update button.......................

                widget.id == null
                    ? CustomButton(
                        isResponsive: true,
                        text: 'Add',
                        onTap: () {
                          if (productViewModel.formKey.value.currentState!
                              .validate()) {
                            productViewModel.addProduct();
                          }
                        },
                      )
                    : CustomButton(
                        isResponsive: true,
                        text: 'Update',
                        onTap: () {
                          // if (productViewModel.formKey.value.currentState!
                          //     .validate()) {
                          //   productViewModel.addProduct();
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: CustomText(
        text: 'Product',
        size: 20,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
