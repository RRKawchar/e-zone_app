import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/core/helper/helper_method.dart';
import 'package:e_zone/view/users/user_details.dart';
import 'package:e_zone/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final userViewModel = Get.find<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Users",
          size: 30,
        ),
      ),
      body: Obx(
        () {
          if (userViewModel.isLoading.value) {
            return kCircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: userViewModel.userList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.to(UserDetailsScreen(
                      index: index,
                      userViewModel: userViewModel,),);
                },
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueGrey,
                  child: Center(
                    child: CustomText(
                      text: userViewModel.userList[index].username![0],
                      size: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: CustomText(
                  text: userViewModel.userList[index].username.toString(),
                  color: Colors.black,
                  size: 25,
                ),
                subtitle: CustomText(
                  text: userViewModel.userList[index].email.toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
