class UserEntity {
  String? email;
  String? fullname;

  UserEntity({this.email, this.fullname});

  UserEntity.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullname'] = fullname;
    return data;
  }
}