import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import 'image_icone.dart';

class GainLossWidget extends StatelessWidget {
  const GainLossWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 67.h,
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.secondDarkColor,
                  borderRadius: BorderRadius.circular(6.sp)
              ),
              child: Column(
                children: [
                  Text("0.34 \$", style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: AppColors.succesColor
                  ),),
                  SizedBox(height: 5.h,),
                  Text("Gain moyen / Trade", style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: AppColors.greyColor
                  ),),
                ],
              ),
            ),
            SizedBox(height: 12.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: AppColors.secondDarkColor,
                  borderRadius: BorderRadius.circular(6.sp)
              ),
              width: 150.w,
              child: Column(
                children: [
                  ImageIcone(url: 'assets/images/Group 10777.png', func: (){},width: 35.w,height: 32.h,),
                  Text("20,000 \$", style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    color: AppColors.succesColor
                  ),),
                  SizedBox(height: 5.h,),
                  Text("Plus gros gain", style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 12.sp,
                      color: AppColors.greyColor
                  ),)
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 67.h,
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.secondDarkColor,
                  borderRadius: BorderRadius.circular(6.sp)
              ),
              child: Column(
                children: [
                  Text("0.34 \$", style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: AppColors.errorColor
                  ),),
                  SizedBox(height: 5.h,),
                  Text("Perte moyenne / Trade", style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: AppColors.greyColor
                  ),),
                ],
              ),
            ),
            SizedBox(height: 12.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: AppColors.secondDarkColor,
                  borderRadius: BorderRadius.circular(6.sp)
              ),
              width: 170.w,
              child: Column(
                children: [
                  ImageIcone(url: 'assets/images/Group 10777 (1).png', func: (){},width: 35.w,height: 32.h,),
                  Text("22,070 \$", style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.succesColor
                  ),),
                  SizedBox(height: 5.h,),
                  Text("Plus grosse perte", style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 12.sp,
                      color: AppColors.greyColor
                  ),)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}