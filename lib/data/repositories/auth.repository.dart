import 'package:flutter_jett_boilerplate/data/const/app_get_key.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/user.entity.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  static void saveToken(String token) {
    GetStorage().write(AppGetKey.ACCESS_TOKEN, token);
  }
  static String? getSavedToken() {
    String? token = GetStorage().read(AppGetKey.ACCESS_TOKEN);
    if(token == null) {
      return null;
    }
    return token;
  }
}
