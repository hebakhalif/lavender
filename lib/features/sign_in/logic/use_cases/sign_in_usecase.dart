import 'package:lavender/features/sign_in/data/models/user_model.dart';
import 'package:lavender/features/sign_up/logic/repositories_interface/auth_repository.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}

class SignInUseCase {
  final AuthRepository authRepository;
  SignInUseCase(this.authRepository);

  Future<UserModel> call(SignInParams params) {
    return authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}