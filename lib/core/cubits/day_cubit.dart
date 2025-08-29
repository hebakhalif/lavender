import 'package:flutter_bloc/flutter_bloc.dart';

class DayCubit extends Cubit<int> {
  DayCubit() : super(2);

  void selectDay(int index) {
    emit(index);
  }
}
