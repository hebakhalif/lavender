import 'package:lavender/features/sign_up/logic/entities/user_entity.dart';
import 'package:lavender/features/sign_up/logic/repositories_interface/auth_repository.dart';

class SignUpParams {
  final String first_name;
  final String last_name;
  final String email;
  final String password;

  SignUpParams({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
  });
}

class SignUpUseCase {
 final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future<UserEntity> call(SignUpParams params)async {
    return await authRepository.signUp(
      firstName:params.first_name,
      lastName:params.last_name,
      email:params.email,
      password:params.password,
    );
  }
}
