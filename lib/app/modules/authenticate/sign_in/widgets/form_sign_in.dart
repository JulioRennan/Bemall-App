import 'package:bemall_app/app/app_theme.dart';
import 'package:bemall_app/app/modules/authenticate/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_field_authenticate.dart';

class FormSignIn extends StatelessWidget {
  final SignInController controller;

  FormSignIn({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    controller.formKey = controller.formKey ?? GlobalKey<FormState>();
    controller.emailController = controller.emailController ??
        TextEditingController(text: 'julio.rennann@gmail.com');
    controller.passwordController =
        controller.passwordController ?? TextEditingController(text: '1234567');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFieldAuthenticate(
            labelText: "Email",
            controller: controller.emailController,
            prefixIcon: Icon(
              Icons.email,
              color: AppTheme.appColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldAuthenticate(
            labelText: "Senha",
            controller: controller.passwordController,
            prefixIcon: Icon(
              Icons.key,
              color: AppTheme.appColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
