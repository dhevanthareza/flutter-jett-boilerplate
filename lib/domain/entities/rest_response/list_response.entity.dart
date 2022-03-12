import 'package:flutter_jett_boilerplate/domain/entities/rest_response/error_response_object.entity.dart';

class ListResponseEntity {
  bool? success;
  ErrorResponseObjectModel? error;
  List<dynamic>? data;

  ListResponseEntity({this.data, this.error, this.success});

  // expected json
  // {
  //   'data': [],
  //   'error': null / {'message': 'Terjadi Error', 'code': },
  //   'success': true / false
  // }
  ListResponseEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    error = json['error'] != null
        ? ErrorResponseObjectModel.fromJson(json['error'])
        : null;
    success = json['success'];
  }
}
