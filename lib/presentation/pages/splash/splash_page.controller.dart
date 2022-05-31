import 'package:flutter_jett_boilerplate/data/repositories/user.repository.dart';
import 'package:get/get.dart';

import '../../../domain/entities/auth/user.entity.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkUser();
  }

  void checkUser() {
    Future.delayed(const Duration(milliseconds: 100), () {
      UserEntity? user = UserRepository.getSavedUser();
      if (user == null) {
        Get.offAllNamed("/user/login");
      } else {
        Get.offAllNamed("/app");
      }
    });
  }
}
