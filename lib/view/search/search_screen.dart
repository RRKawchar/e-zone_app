import 'package:e_zone/view/search/widgets/search_body_widget.dart';
import 'package:e_zone/view/search/widgets/search_top_widget.dart';
import 'package:e_zone/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchViewModel = Get.find<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Here back button limit textField and search textField

            SearchTopWidget(searchViewModel: searchViewModel),

            /// Here Body
           SearchBodyWidget(searchViewModel: searchViewModel)
          ],
        ),
      ),
    );
  }
}
