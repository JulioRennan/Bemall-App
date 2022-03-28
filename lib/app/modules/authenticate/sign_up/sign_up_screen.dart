import 'package:bemall_app/app/app_colors.dart';
import 'package:bemall_app/app/app_theme.dart';
import 'package:bemall_app/app/modules/authenticate/sign_up/sign_up_controller.dart';
import 'package:bemall_app/app/modules/authenticate/sign_up/widgets/form_sign_up.dart';
import 'package:bemall_app/app/modules/shared_components/buttons/button_fill.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpScreen extends StatelessWidget {
  final controller = SignUpController();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
      ),
      body: GetBuilder<SignUpController>(
        init: controller,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormSignUp(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (!controller.hideAddress)
                    ButtonFill(
                      title: "registrar",
                      onTap: controller.signUp,
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
