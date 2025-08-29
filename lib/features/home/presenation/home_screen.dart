import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/themes/app_colors.dart';
import '../../../core/routing/router.dart';
import '../widgets/doctor_card.dart';
import '../widgets/view_all_row.dart';
import '../../../../l10n/app_localizations.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 212,
            decoration: BoxDecoration(
              color: AppColors.primaryColorLavenderLangAndText,
              // gradient: AppColors.linearGradient,
              borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(32), bottomEnd: Radius.circular(32))
            ),

          ),
          ViewAllRow(title: AppLocalizations.of(context)?.start_your_journey ?? "start_your_journey", onTap: () {  },),
          ListView.separated(
            itemCount: 1,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return DoctorCard(onTap: (){
                Navigator.pushNamed(
                  context,
                  Routes.psychologistDetailsPage,
                );

                ;
              },);
            },
          ),

        ],
      ),
    );
}
}