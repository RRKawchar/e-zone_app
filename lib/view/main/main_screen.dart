import 'package:e_zone/view/main/widgets/bottom_navbar_widget.dart';
import 'package:e_zone/view_model/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);

  final mainViewModel = Get.put(MainViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: mainViewModel.pages[mainViewModel.selectedIndex.value],
        );
      }),
      bottomNavigationBar: BottomNavbarWidget(
        mainViewModel: mainViewModel,
      ),
    );
  }
}
