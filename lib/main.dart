import 'package:e_zone/core/app_theme/app_theme.dart';
import 'package:e_zone/core/binding/app_binding.dart';
import 'package:e_zone/core/routes/app_routes.dart';
import 'package:e_zone/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "";
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


