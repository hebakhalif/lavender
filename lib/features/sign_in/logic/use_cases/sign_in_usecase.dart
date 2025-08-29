import 'package:lavender/features/sign_in/logic/repositories_interface/auth_repo.dart';
import 'package:lavender/features/sign_up/logic/entities/user_entity.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}

class SignInUsecase {
 final AuthRepository authRepository;

  SignInUsecase(this.authRepository);

  Future<UserEntity> call(SignInParams params)async {
    return await authRepository.signIn(
      email:params.email,
      password:params.password,
    );
  }
}
