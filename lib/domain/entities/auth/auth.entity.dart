class AuthEntity {
  String? accessToken;
  // String? tokenType;
  // int? expiresIn;
  // String? refreshToken;

  AuthEntity({
    this.accessToken,
    // this.tokenType,
    // this.expiresIn,
    // this.refreshToken,
  });

  AuthEntity.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    // tokenType = json['token_type'];
    // expiresIn = json['expires_in'];
    // refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    // data['token_type'] = this.tokenType;
    // data['expires_in'] = this.expiresIn;
    // data['refresh_token'] = this.refreshToken;
    return data;
  }
}
