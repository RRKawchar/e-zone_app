import 'package:e_zone/core/binding/app_binding.dart';
import 'package:e_zone/core/res/app_theme/app_theme.dart';
import 'package:e_zone/core/res/constants/constants.dart';
import 'package:e_zone/core/res/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
       initialBinding: AppBindings(),
       getPages: AppRoutes.appRoutes()
    );
  }
}


