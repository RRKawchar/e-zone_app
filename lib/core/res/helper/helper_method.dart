import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



  /// To check internet connection
   Future<bool> get checkInternet async{

   var result= await (Connectivity().checkConnectivity());
    if(result==ConnectivityResult.none){
     return false;
    }
   return true;
  }



  /// print debug mode

 kPrint(String message){
     if(kDebugMode){
       print(message);
     }
 }


 /// Circular Progress Indicator
 kCircularProgressIndicator(){
     return const Center(child: CircularProgressIndicator(),);
 }

 /// SnackBar
 kSnackBar({required String message}){
   Get.snackbar('Warning!!', message,backgroundColor: Colors.black,colorText:Colors.red,);
 }