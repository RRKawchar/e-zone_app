import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
