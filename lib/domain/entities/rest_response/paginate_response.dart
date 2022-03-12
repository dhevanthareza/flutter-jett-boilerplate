import 'error_response_object.entity.dart';

class PaginateResponse {
  bool? success;
  ErrorResponseObjectModel? error;
  int? total;
  List<Map<String, dynamic>> rows = [];

  PaginateResponse({this.success, this.error, required this.rows, this.total});

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
    error = json['error'] != null ? ErrorResponseObjectModel.fromJson(json['error']) : null;
    if (json['data']['data'] != null) {
      rows = [];
      json['data']['data'].forEach((v) {
        rows.add(v);
      });
    }
    success = json['success'];
  }
}