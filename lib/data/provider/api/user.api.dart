import 'package:flutter_jett_boilerplate/utils/rest_client.dart';

import '../../../domain/entities/rest_response/default_response.entity.dart';

class UserApi {
  static Future<DefaultResponseEntity> login(
    String email,
    String password,
    String fcm,
  ) async {
    dynamic response = await RestClient.post(
      "/login",
      data: {
        'username': email,
        'password': password,
        'fcm_token': fcm,
      },
    );
    // dynamic response = {
    //   'success': true,
    //   'error': null,
    //   'data': {'access_token': 'SOME_JWT_TOKEN'}
    // };
    return DefaultResponseEntity.fromJson(response);
  }

  static Future<DefaultResponseEntity> me() async {
    dynamic response = await RestClient.get(
      "/profil",
    );
    // dynamic response = {
    //   'success': true,
    //   'error': null,
    //   'data': {'email': 'some@email.com', 'fullname': "Dhevan Muhamad Antharea"}
    // };
    // await Future.delayed(Duration(seconds: 2), () {});
    return DefaultResponseEntity.fromJson(response);
  }
}
