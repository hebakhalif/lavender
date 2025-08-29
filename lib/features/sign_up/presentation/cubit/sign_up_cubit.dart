import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lavender/features/sign_up/logic/entities/user_entity.dart';
import 'package:lavender/features/sign_up/logic/use_cases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase signUpUseCase;
  SignUpCubit(this.signUpUseCase,) : super(SignUpInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
   
   @override
  Future <void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
   return super.close();
  }

  Future<void> signUp({
    required String first_name,
     required String last_name,
      required String email,
       required String password
       }) async {
  //  if (!formKey.currentState!.validate()) return;

    emit(SignUpLoading());
    try {
      print("يتم التسجيل ");
      final user = await signUpUseCase(
        SignUpParams(
          first_name: firstNameController.text.trim(),
          last_name: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    print("رجع من اليوزر كيس: $user");
      emit(SignUpSuccess(user: user));
    } catch (e) {
      emit(SignUpError("حدث خطأ: ${e.toString()}"));
    }
  }
}
 

