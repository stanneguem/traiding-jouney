import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trading_journey/app/app_routes.dart';
import 'package:trading_journey/app/route_names.dart';
import 'package:trading_journey/features/auth/login/controllers.dart';

import 'app/app_themes.dart';
import 'features/auth/register/register_controller.dart';
import 'features/onbording/controller.dart';

void main() {
  Get.put(OnbordingController());
  Get.put(LoginControllers());
  Get.put(RegisterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Trader journey',
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: AppName.onbording,
          getPages: AppPAges.pages,
        );
      },
    );
  }
}