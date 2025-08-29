import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavender/core/cubits/day_cubit.dart';
import 'day_chip.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({super.key});

  final List<String> days = const ["الأحد", "الاثنين", "الثلاثاء", "الأربعاء", "الخميس"];
  final List<String> dates = const ["7", "8", "9", "10", "11"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayCubit, int>(
      builder: (context, selectedIndex) {
        return SizedBox(
          height: 68,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return DayChip(
                day: days[index],
                date: dates[index],
                selected: selectedIndex == index,
                onTap: () {
                  context.read<DayCubit>().selectDay(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}
