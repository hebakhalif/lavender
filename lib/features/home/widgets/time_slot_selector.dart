import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavender/core/cubits/slot_cubit.dart';
import 'time_slot.dart';

class TimeSlotSelector extends StatelessWidget {
  const TimeSlotSelector({super.key});

  final List<String> slots = const [
    "10:30ص - 11:30ص",
    "11:30ص - 12:30ص",
    "2:30م - 3:30م",
    "3:30م - 4:30م",
    "12:30م - 1:30م",
    "4:30م - 5:30م",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotCubit, int?>(
      builder: (context, selectedIndex) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(slots.length, (index) {
            return TimeSlot(
              label: slots[index],
              booked: index == 3 ? true : false,
              selected: selectedIndex == index,
              onTap: () {
                context.read<SlotCubit>().selectSlot(index);
              },
            );
          }),
        );
      },
    );
  }
}
