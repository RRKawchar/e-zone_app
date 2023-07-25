import 'package:e_zone/view/home/widgets/drawer_widget.dart';
import 'package:e_zone/view/home/widgets/home_appbar_widget.dart';
import 'package:e_zone/view/home/widgets/home_body_widget.dart';
import 'package:e_zone/view/home/widgets/sale_view_widget.dart';
import 'package:e_zone/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.find<HomeViewModel>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [

            /// Home Drawer Logo And search iconButton
           HomeAppbarWidget(scaffoldKey: _scaffoldKey),
            const Divider(),
           /// Super sale text and view all
           const SaleViewWidget(),
           /// Home body items
           HomeBodyWidget(homeViewModel: homeViewModel)
          ],
        ),
      ),
    );
  }
}
