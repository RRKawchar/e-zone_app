import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserViewModel userViewModel;
  final int index;
  const UserDetailsScreen(
      {super.key, required this.userViewModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final userList=userViewModel.userList[index];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: CustomText(
          text: userViewModel.userList[index].username.toString(),
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
                  "${userList.name!.firstname} ${userList.name!.lastname}",
              size: 25,
            ),
            CustomText(text:userList.email.toString(),size: 17,),
            CustomText(text:userList.phone.toString(),size: 17,),
            CustomText(text:"${userList.address!.city}, ${userList.address!.street} ",size: 17,),

          ],
        ),
      ),
    );
  }
}
