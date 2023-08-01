import 'package:e_zone/view/search/widgets/text_filed_widget.dart';
import 'package:e_zone/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTopWidget extends StatelessWidget {
  final SearchViewModel searchViewModel;
  const SearchTopWidget({Key? key, required this.searchViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Back Button...................

        IconButton(
          onPressed: () {
            searchViewModel.idController.value.clear();
            searchViewModel.limitController.value.clear();
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),

        /// Here Limit TextField ..........................

        TextFieldWidget(
          hintText: "Limit",
          controller: searchViewModel.limitController.value,
          focusNode: searchViewModel.limitFocus.value,
          onChanged: (value) {
            if (searchViewModel.limitFocus.value.hasFocus &&
                searchViewModel.idController.value.text.isNotEmpty) {
              searchViewModel.idController.value.clear();
            }
            searchViewModel.fetchLimitProduct(value);
          },
        ),

        /// Here Search Text filed
        TextFieldWidget(
          hintText: "Search by id....",
          controller: searchViewModel.idController.value,
          focusNode: searchViewModel.idFocus.value,
          onSubmitted: (value) {
            if (searchViewModel.idFocus.value.hasFocus &&
                searchViewModel.limitController.value.text.isNotEmpty) {
              searchViewModel.limitController.value.clear();
            }

            int? id = int.tryParse(value);
            if (id != null) {
              searchViewModel.fetchSearchProduct(id);
            } else {
              searchViewModel.fetchSearchProduct(0);
            }
          },
        ),
      ],
    );
  }
}
