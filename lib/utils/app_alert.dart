import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/const/app_color.dart';

class AppAlert {
  static showErrorFlash({
    title,
    message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static showWarningFlash({
    title,
    message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.yellow,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }

  static showSuccessFlash({
    title,
    message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }
}
