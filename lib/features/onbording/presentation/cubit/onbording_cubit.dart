import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  final Box box;
  OnbordingCubit(this.box) : super(OnbordingInitial());
  int currentPage = 0;

   void checkIfOnboardingCompleted() {
    final bool isDone = box.get('onboarding_completed', defaultValue: false);
    if(isDone){
      emit(OnbordingCompleted()); 
    } else {
      emit(OnbordingNotCompleted());
    }
  }
    void completeOnboarding()  {
     box.put('onboarding_completed', true);
    emit(OnbordingCompleted());
  }
}
