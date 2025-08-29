 class UserModel{
  final String status;
  final String accessToken;
  final String refreshToken;

  UserModel
  ({
    required this.status, 
    required this.accessToken,
     required this.refreshToken
     });
     
     factory UserModel.fromJson(Map<String, dynamic> json) {
      return UserModel(
        status: json['status'] as String,
        accessToken: json['access_token'] as String,
        refreshToken: json['refresh_token'] as String,
      );
 }}