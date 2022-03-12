import '../../../domain/entities/rest_response/default_response.entity.dart';

class UserApi {
  static Future<DefaultResponseEntity> login(
    String email,
    String password,
  ) async {
    // dynamic response = await RestClient.post(
    //   "/some-url",
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // );
    dynamic response = {
      'success': true,
      'error': null,
      'data': {'access_token': 'SOME_JWT_TOKEN'}
    };
    return DefaultResponseEntity.fromJson(response);
  }

  static Future<DefaultResponseEntity> me() async {
    // dynamic response = await RestClient.get(
    //   "/some-url",
    // );
    dynamic response = {
      'success': true,
      'error': null,
      'data': {'email': 'some@email.com', 'fullname': "Dhevan Muhamad Antharea"}
    };
    await Future.delayed(Duration(seconds: 2), () {});
    return DefaultResponseEntity.fromJson(response);
  }
}
