import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_jett_boilerplate/domain/entities/core/app_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config.dart';

class RestClient {
  // ignore: top_level_function_literal_block, prefer_function_declarations_over_variables
  static final client = () async {
    var dio = Dio(
      BaseOptions(
        followRedirects: true,
        headers: {"Accept": "application/json"},
        connectTimeout: 30000,
        receiveTimeout: 30000,
        baseUrl: '${AppConfig.gateway}/api',
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
    // var appBox = await Hive.box(AppConfig.appbox);
    // AuthModel? auth = appBox.get('auth');
    // print("============client");
    // if (auth != null) {
    //   print("=======accesstoken=========");
    //   print(auth.accessToken);
    //   dio.options.headers['Authorization'] = "Bearer ${auth.accessToken}";
    // }
    return dio;
  };
  static dynamic _returnResponse(Response? response) {
    if (response == null) {
      throw AppException(message: 'Tidak dapat terkoneksi dengan API');
    }
    _handleResponse(response);
  }

  static dynamic _returnErr(DioError err) {
    Response? response = err.response;
    if (response == null) {
      throw AppException(message: err.message);
    }
    if (err.response!.data['error'] == null) {
      throw AppException(
          message: response.data['error']['message'] ?? 'Undefined Error 500');
    }
    _handleResponse(response);
  }

  static _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 201:
        var responseJson = response.data;
        return responseJson;
      case 400:
        throw AppException(
            message:
                response.data['error']['message'] ?? 'Undefined Error 400');
      case 401:
        // AppAuth.logout();
        throw AppException(
            message:
                response.data['error']['message'] ?? 'Undefined Error 401');
      case 403:
        throw AppException(
            message:
                response.data['error']['message'] ?? 'Undefined Error 403');
      case 404:
        throw AppException(
            message:
                response.data['error']['message'] ?? 'Undefined Error 404');
      case 422:
        throw AppException(
            message:
                response.data['error']['message'] ?? 'Undefined Error 422');
      case 500:
        throw AppException(
            message:
                response.data['error']['message'] ?? 'Undefined Error 422');
      default:
      // throw AppException(
      //     message: err.response!.data != null &&
      //             FlavorConfig.instance!.flavor == Flavor.DEV
      //         ? err.response!.data['detail']
      //         : 'Maaf sedang terjadi error');
    }
  }

  static Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameter}) async {
    dynamic responseJson;
    try {
      Dio _client = await client();
      dynamic response =
          await _client.get(url, queryParameters: queryParameter);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw AppException(message: 'No Internet connection');
    } on DioError catch (err) {
      responseJson = _returnResponse(err.response);
    }
    return responseJson;
  }

  static Future<dynamic> post(String url, {dynamic data}) async {
    dynamic responseJson;
    Response response;
    try {
      Dio _client = await client();
      response = await _client.post(url, data: data);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw AppException(message: 'No Internet connection');
    } on DioError catch (err) {
      responseJson = _returnErr(err);
    }
    return responseJson;
  }

  static Future<dynamic> patch(String url, {dynamic data}) async {
    dynamic responseJson;
    Response response;
    try {
      Dio _client = await client();
      response = await _client.patch(url, data: data);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw AppException(message: 'No Internet connection');
    } on DioError catch (err) {
      responseJson = _returnErr(err);
    }
    return responseJson;
  }

  static Future<dynamic> delete(String url, {dynamic data}) async {
    dynamic responseJson;
    Response response;
    try {
      Dio _client = await client();
      response = await _client.delete(url, data: data);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw AppException(message: 'No Internet connection');
    } on DioError catch (err) {
      responseJson = _returnErr(err);
    }
    return responseJson;
  }
}
