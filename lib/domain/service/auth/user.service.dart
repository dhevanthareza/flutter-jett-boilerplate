import 'package:flutter_jett_boilerplate/data/provider/api/user.api.dart';
import 'package:flutter_jett_boilerplate/data/repositories/auth.repository.dart';
import 'package:flutter_jett_boilerplate/data/repositories/user.repository.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/auth.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/user.entity.dart';

class UserService {
  static Future<UserEntity> login(String email, String password, String fcm) async {
    AuthEntity auth = await UserRepository.login(email, password, fcm);
    AuthRepository.saveToken(auth.accessToken!);
    UserEntity user = await UserRepository.getUserData();
    UserRepository.getSaveUserData(user.toJson());
    return user;
  }

  static Future<void> logout() async {
    await UserRepository.clearUserData();
  }
}
