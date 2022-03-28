import 'package:bemall_app/app/modules/home/home_screen.dart';
import 'package:get/route_manager.dart';

import '../modules/authenticate/sign_in/sign_in_screen.dart';
import '../modules/authenticate/sign_up/sign_up_screen.dart';

// ignore_for_file: non_constant_identifier_names
class AppRoutes {
  static String AUTH = '/auth';
  static String SIGN_IN = '$AUTH/sign-in';
  static String SIGN_UP = '$AUTH/sign-up';
  static String HOME = '/home';
}

final AppPages = [
  GetPage(
    name: AppRoutes.HOME,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.SIGN_IN,
    page: () => SignInScreen(),
  ),
  GetPage(
    name: AppRoutes.SIGN_UP,
    page: () => SignUpScreen(),
  ),
];
