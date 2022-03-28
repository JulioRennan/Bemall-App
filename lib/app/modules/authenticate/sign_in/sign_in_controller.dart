import 'package:bemall_app/app/app_controller.dart';
import 'package:bemall_app/app/repositories/local_storage/settings_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../repositories/rest_utils/authenticate_repository.dart';

class SignInController extends GetxController {
  GlobalKey<FormState>? formKey;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  final authenticateRepository = AuthenticateRepository();
  final settingsStorage = SettingsStorageRepository();

  Future signIn() async {
    if (formKey?.currentState?.validate() ?? false) {
      final userToken = await authenticateRepository.signIn(
        emailController!.text,
        passwordController!.text,
      );
      await AppController.to.saveToken(userToken);
    }
  }
}
