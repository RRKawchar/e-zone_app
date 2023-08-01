import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:e_zone/view/home/widgets/drawer_widget.dart';
import 'package:e_zone/view/home/widgets/home_appbar_widget.dart';
import 'package:e_zone/view/home/widgets/home_body_widget.dart';
import 'package:e_zone/view/home/widgets/sale_view_widget.dart';
import 'package:e_zone/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.find<HomeViewModel>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var body={
    'title': 'test product',
    'price': 13.5,
    'description': 'lorem ipsum set',
    'image': 'https://w7.pngwing.com/pngs/724/729/png-transparent-calculator-calculator-electronics-calculator-technology-thumbnail.png',
    'category': 'electronic'
  };


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
            SaleViewWidget(),

           /// Home body items
            HomeBodyWidget(homeViewModel: homeViewModel),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          homeViewModel.addProduct(body: body);

          kPrint("$body");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
