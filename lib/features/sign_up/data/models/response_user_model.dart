class ResponseSignUpModel {
    final String status;
    final dynamic message;
    final String? userId;

 ResponseSignUpModel({
    required this.status,
    required this.message,
    this.userId,
});

 factory ResponseSignUpModel.fromJson(Map<String, dynamic> json) {
    return ResponseSignUpModel(
      status: json['status'] as String,
      message: json['message'],
    );
  }
}