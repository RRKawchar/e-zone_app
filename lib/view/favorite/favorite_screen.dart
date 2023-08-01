import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextButton(

              onPressed: () {},
              child: Text(
                "TextButton1",
              ),
            ),
            const SizedBox(height: 200,),
            TextButton(onPressed: () {}, child: Text("TextButton2")),
          ],
        ),
      ),
    );
  }
}
