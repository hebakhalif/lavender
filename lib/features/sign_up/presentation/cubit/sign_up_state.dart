part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccess extends SignUpState {
  final UserEntity user;
  final String message;
  SignUpSuccess({required this.user, this.message = "تم تسجيل الدخول بنجاح"});
}

final class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message);
}