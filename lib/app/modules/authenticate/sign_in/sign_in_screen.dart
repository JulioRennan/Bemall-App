import 'package:bemall_app/app/modules/authenticate/sign_in/sign_in_controller.dart';
import 'package:bemall_app/app/modules/authenticate/sign_in/widgets/form_sign_in.dart';
import 'package:bemall_app/app/modules/shared_components/buttons/button_fill.dart';
import 'package:bemall_app/app/modules/shared_components/buttons/button_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_theme.dart';
import '../../../routes/pages.dart';

class SignInScreen extends StatelessWidget {
  final controller = Get.put(SignInController());
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColors.primaryColor,
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 400,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                FormSignIn(controller: controller),
                ButtonFill(
                  width: Get.width,
                  title: "entrar",
                  onTap: () => controller.signIn().then((_) {
                    Get.offNamed(AppRoutes.HOME);
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonText(
                  title: "cadastrar-se",
                  onPressed: () => Get.toNamed(
                    AppRoutes.SIGN_UP,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
