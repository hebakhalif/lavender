import 'package:lavender/features/sign_in/data/models/user_model.dart';
import 'package:lavender/features/sign_up/logic/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
  Future<void> resetPassword(String email);
}
