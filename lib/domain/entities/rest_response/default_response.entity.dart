import 'package:flutter_jett_boilerplate/domain/entities/rest_response/error_response_object.entity.dart';

class DefaultResponseEntity {
  String? message;
  String? code;
  int? status;
  dynamic data;

  DefaultResponseEntity({
    this.data,
    this.message,
    this.code,
    this.status,
  });

  // expected json
  // {
  //   "message": "Success",
  //   "code": "SUCCESS",
  //   "data": {
  //   },
  //   "status": 200
  // }
  DefaultResponseEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    code = json['code'];
    status = json['status'];
  }
}
