import 'package:get/get.dart';
import 'package:trading_journey/app/route_names.dart';
import 'package:trading_journey/features/index.dart';

class AppPAges{
  static final pages = [
    GetPage(
      name: AppName.onbording,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: AppName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppName.forgotPassword,
      page: () => ResetPasswordPage(),
    ),
    GetPage(
      name: AppName.register,
      page: () => RegisterScreen(),
    ),
  ];
}