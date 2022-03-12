import 'package:flutter/cupertino.dart';
import 'package:flutter_jett_boilerplate/domain/entities/core/app_exception.dart';
import 'package:flutter_jett_boilerplate/domain/service/auth/user.service.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';
import 'package:get/get.dart';
import 'package:load/load.dart';

class LoginPageController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    showLoadingDialog();
    try {
      await UserService.login(emailTextController.text, passwordTextController.text);
      Get.offAllNamed("/home");
      hideLoadingDialog();
    } on AppException catch (err) {
      Get.snackbar(
        "Gagal Login",
        StringUtils.getOrElse(err.message, "_"),
      );
      hideLoadingDialog();
    }
  }
}