import 'package:e_zone/core/res/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      drawer: Drawer(
        // Add the Drawer widget here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Item 1'),
              onTap: () {
                // Define the action when Item 1 is tapped
                Navigator.pop(context); // Close the drawer
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Item 2'),
              onTap: () {
                // Define the action when Item 2 is tapped
                Navigator.pop(context); // Close the drawer
                // Add your navigation logic here
              },
            ),
            // Add more ListTiles for additional menu items
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 80,

                  child: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu)),
                ),
            const SizedBox(width: 60,),
                Container(
                    height: 50,
                    width: 100,
                    child: Image.asset(appLogo,)),
                const SizedBox(width: 60,),
                Container(
                  height: 50,
                  width: 80,

                  child: IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(Icons.search,size: 30,)),
                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}
