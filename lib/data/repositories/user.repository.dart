import 'package:flutter_jett_boilerplate/data/const/app_get_key.dart';
import 'package:flutter_jett_boilerplate/data/provider/api/user.api.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/auth.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/user.entity.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository {
  static Future<AuthEntity> login(String email, String password, String fcm) async {
    return AuthEntity.fromJson(
      (await UserApi.login(email, password, fcm)).data,
    );
  }

  static Future<UserEntity> getUserData() async {
    return UserEntity.fromJson(
      (await UserApi.me()).data,
    );
  }

  static void getSaveUserData(Map<String, dynamic> userJson) {
    GetStorage().write(AppGetKey.USER, userJson);
  }

  static UserEntity? getSavedUser() {
    Map<String, dynamic>? userJson = GetStorage().read(AppGetKey.USER);
    if (userJson == null) {
      return null;
    }
    return UserEntity.fromJson(userJson);
  }

  static Future<void> clearUserData() async {
    await GetStorage().remove(AppGetKey.USER);
    await GetStorage().remove(AppGetKey.ACCESS_TOKEN);
  }
}
