import 'package:flutter_bloc/flutter_bloc.dart';

class DayCubit extends Cubit<DateTime> {
  DayCubit() : super(DateTime.now());

  final List<String> weekDays = [
    "الأحد",
    "الاثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
  ];

  void selectDay(DateTime date) {
    emit(date);
  }

  Map<String, List<String>> getCurrentWeekDaysAndDates() {
    DateTime now = DateTime.now();

    List<String> days = [];
    List<String> dates = [];

    for (int i = 0; i < 6; i++) {
      DateTime day = now.add(Duration(days: i));
      days.add(weekDays[day.weekday % 7]);
      dates.add(day.day.toString());
    }

    return {
      "days": days,
      "dates": dates,
    };
  }
}
