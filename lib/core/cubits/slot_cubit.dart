import 'package:flutter_bloc/flutter_bloc.dart';

class SlotCubit extends Cubit<int?> {
  SlotCubit() : super(null);

  void selectSlot(int index) {
    emit(index);
  }
}
