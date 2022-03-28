import 'package:bemall_app/app/app_controller.dart';
import 'package:bemall_app/app/app_theme.dart';
import 'package:bemall_app/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  final appController = Get.put(AppController(), permanent: true);
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(appController.getInitialRoute);
    return GetMaterialApp(
      theme: AppTheme().defaultTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppPages,
      initialRoute: appController.getInitialRoute,
    );
  }
}
