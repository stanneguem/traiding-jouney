import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trading_journey/core/utils/colors.dart';

import 'calendar_custom.dart';
import 'image_icone.dart';

class PeriodWidget extends StatelessWidget {
  const PeriodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      width: double.maxFinite,
      height: 43.h,
      decoration: BoxDecoration(
        color: AppColors.secondDarkColor,
        borderRadius: BorderRadius.circular(8.sp)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageIcone(url: 'assets/images/Calendar.png', func: _showCalendar, width: 28,height: 26,),
              Text("15 Sep 2023", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
          Icon(Icons.arrow_forward),
          Row(
            children: [
              ImageIcone(url: 'assets/images/Calendar.png', func: () {  }, width: 28,height: 26,),
              Text("15 Sep 2023", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400
              ),)
            ],
          ),
        ],
      ),
    );
  }

  void _showCalendar() async {
    final selectedDates = await Get.dialog<Set<DateTime>>(
      CustomCalendar(rangeColor: Color(0x00411606),endColor: AppColors.primaryColor, startColor: AppColors.primaryColor,),
      barrierDismissible: false, // Empêche de fermer en cliquant dehors
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 300),
    );

    if (selectedDates != null && selectedDates.isNotEmpty) {
      print("Dates sélectionnées : $selectedDates");
      // tu peux les stocker dans un controller GetX ici
    }
  }
}