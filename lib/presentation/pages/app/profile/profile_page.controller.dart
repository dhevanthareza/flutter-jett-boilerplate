import 'package:flutter_jett_boilerplate/data/repositories/user.repository.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/user.entity.dart';
import 'package:flutter_jett_boilerplate/domain/service/auth/user.service.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  bool isFetchingUserData = false;
  UserEntity? userData;
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  fetchUserData() {
    isFetchingUserData = true;
    update();
    userData = UserRepository.getSavedUser();
    isFetchingUserData = false;
    update();
  }

  void handleLogoutClick() async {
    await UserService.logout();
    Get.offAllNamed("/user/login");
  }
}
