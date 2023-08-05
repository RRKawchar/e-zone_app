import 'package:e_zone/core/res/components/custom_button.dart';
import 'package:e_zone/view_model/product_vew_model.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final ProductViewModel productViewModel;
  final String? title;
  final String? price;
  final String? category;
  final String? description;
  final int? id;
  const FormWidget({
    super.key,
    required this.productViewModel,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: productViewModel.formKey.value,
      child: Column(
        children: [
          TextFormField(
            controller:
                title == null ? null : productViewModel.titleController.value,
            decoration: InputDecoration(
              hintText: title ?? "Title",
              border: const OutlineInputBorder(),
            ),
            validator: (value) => productViewModel.titleValidation(value),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller:
                price == null ? null : productViewModel.priceController.value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: price ?? "Price",
              border: const OutlineInputBorder(),
            ),
            validator: (value) => productViewModel.priceValidation(value),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: category == null
                ? null
                : productViewModel.categoryController.value,
            decoration: InputDecoration(
              hintText: category ?? "Category",
              border: const OutlineInputBorder(),
            ),
            validator: (value) => productViewModel.categoryValidation(value),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: description == null
                ? null
                : productViewModel.descriptionController.value,
            decoration: InputDecoration(
              hintText: description ?? "Description",
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            ),
            validator: (value) => productViewModel.descriptionValidation(value),
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
