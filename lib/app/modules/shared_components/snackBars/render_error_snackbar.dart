import 'package:flutter/material.dart';
import 'package:get/get.dart';

renderErrorSnackbar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      borderRadius: 10,
      messageText: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Text(
          message,
          style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
