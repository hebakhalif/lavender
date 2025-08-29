import 'package:lavender/core/networking/dio_helper.dart';
import 'package:lavender/features/sign_up/data/models/response_user_model.dart';
import 'package:lavender/features/sign_up/logic/entities/user_entity.dart';
import 'package:lavender/features/sign_up/logic/repositories_interface/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl();

  
 @override
  Future<UserEntity> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try{
    final response = await DioHelper.postData(
      url:"user/register",
      data: {
     "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "email": email.trim(),
      "password": password.trim(),
      },
    );
    print("*** Respone from API: ${response.data}");

    final ResponseSignUpModel responseModel =
    ResponseSignUpModel.fromJson(response.data);                                                 

    if (responseModel.status != 'success') {
      throw Exception('Sign up failed: ${responseModel.message}');
    }

    return UserEntity(
      id: responseModel.userId ?? '',
      name: "$firstName $lastName",
      email: email,
    );
    }catch (e){
      throw Exception("Error in signUp: $e");
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() => throw UnimplementedError();

  @override
  Future<void> resetPassword(String email) => throw UnimplementedError();

  @override
  Future<UserEntity?> signIn(String email, String password) => throw UnimplementedError();

  @override
  Future<void> signOut() => throw UnimplementedError();
}