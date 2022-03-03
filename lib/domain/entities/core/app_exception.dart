class AppException {
  String? message;
  String code;
  int? status;
  Map<String, dynamic>? errors;
  
  AppException({this.message, this.code = "NORMAL", this.errors});
}
