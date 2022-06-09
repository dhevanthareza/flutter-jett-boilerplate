import 'error_response_object.entity.dart';

class PaginateResponse {
  String? message;
  String? code;
  int? status;
  int? total;
  List<Map<String, dynamic>> rows = [];

  PaginateResponse({required this.message, required this.code, required this.status, required this.rows, this.total});

  // expected json
  // {
  //   'data': {   //this object is from default laravel paginate object
  //      'data': [],
  //      'total': 150
  //    },
  //   'error': null / {'message': 'Terjadi Error', 'code': },
  //   'success': true / false
  // }
  PaginateResponse.fromJson(Map<String, dynamic> json) {
    total = json['data']['total'];
    if (json['data']['data'] != null) {
      rows = [];
      json['data']['data'].forEach((v) {
        rows.add(v);
      });
    }
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }
}