import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/stylesdart.dart';
import 'package:lavender/features/home/widgets/day_chip.dart';
import 'package:lavender/features/home/widgets/info_card.dart';
import 'package:lavender/features/home/widgets/time_slot.dart';
import 'package:lavender/features/home/widgets/time_slot_selector.dart';

import '../widgets/day_selector.dart';

class PsychologistDetailsPage extends StatelessWidget {
  const PsychologistDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/psychologist.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Body content
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("مرحباً 👋",
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("أنا ليبان محمد",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.indigo)),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text("4.5",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700])),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        spacing: 10.w,
                        children: [
                          Icon(Icons.watch_later_outlined, color: AppColors.grey, size: 20.sp,),
                          Text("12:00 ص - 3:00 م",
                              style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// Description
                      Text(
                        "أخصائية نفسية متخصصة في دراسة وتحليل سلوك الأفراد "
                            "ووظائف الدماغ من أجل فهم العوامل النفسية التي تؤثر "
                            "على حياتهم. تقوم بتقديم الدعم والاستشارات النفسية "
                            "لمساعدة في تحسين الصحة النفسية للمرضى.",
                        style: TextStyle(color: Colors.grey[800], height: 1.5),
                      ),
                      const SizedBox(height: 16),

                      /// Info stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          InfoCard(title: "7 سنين", subtitle: "خبرة", icon: 'medal-star.png',),
                          InfoCard(title: "50+", subtitle: "المعالجون", icon: 'emoji-normal.png',),
                          InfoCard(title: "200 جنيه", subtitle: "سعر الساعة", icon: 'moneys.png',),
                        ],
                      ),
                      const SizedBox(height: 24),

                      DaySelector (),
                      const SizedBox(height: 24),

                      /// Schedule
                      Text("الجدول 🗓️",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      TimeSlotSelector(),
                      const SizedBox(height: 32),

                      /// Button
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColorLavenderLangAndText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.sp),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "احجز استشارة",
                            style: GoogleFonts.alexandria(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


