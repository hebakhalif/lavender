/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavender/features/sign_in/logic/use_cases/sign_in_usecase.dart';

part 'sign_In_state.dart';

class SignInCubit extends Cubit<SigninState> {
  final SignInUsecase signInUseCase;
  SignInCubit(this.signInUseCase) : super(SigninInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> signIn({required String email, required String password}) async {
    //  if (!formKey.currentState!.validate()) return;

    emit(SigninLoading());
    try {
      print("يتم التسجيل ");
      final user = await signInUseCase(
        SignInParams(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
      print("رجع من اليوزر كيس: $user");
      emit(SigninSuccess(user: user));
    } catch (e) {
      emit(SigninError("حدث خطأ: ${e.toString()}"));
    }
  }
}*/
