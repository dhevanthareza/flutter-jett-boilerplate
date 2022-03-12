class ErrorResponseObjectModel {
  int? code;
  String? message;

  ErrorResponseObjectModel({this.code, this.message});

  ErrorResponseObjectModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }
}