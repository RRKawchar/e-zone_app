import 'package:e_zone/core/res/app_color/app_color.dart';
import 'package:e_zone/core/res/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: InkWell(
        onTap:onTap,
        child: Container(
            height: 40,
            width: 100,
            decoration:  BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: CustomText(text: text,color: Colors.white,),)
        ),
      ),
    );
  }
}