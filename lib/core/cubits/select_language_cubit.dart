import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanguageCubit extends Cubit<String> {
  SelectLanguageCubit() : super("ar");

  void selectLang(String lang) {
    print("Selected Language: $lang");
    emit(lang);
  }
}
