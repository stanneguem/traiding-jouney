import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import 'image_icone.dart';

class CapitalWidget extends StatelessWidget {
  const CapitalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppColors.secondDarkColor,
              borderRadius: BorderRadius.circular(6.sp)
          ),
          width: 100.w,
          child: Column(
            children: [
              ImageIcone(url: 'assets/images/Group 10779.png', func: (){},width: 29.w,height: 29.h,),
              Text("20", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 15.sp,
                fontWeight: FontWeight.bold
              ),),
              Text("Depot total", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 12.sp,
                  color: AppColors.greyColor
              ),)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppColors.secondDarkColor,
              borderRadius: BorderRadius.circular(6.sp)
          ),
          width: 100.w,
          child: Column(
            children: [
              ImageIcone(url: 'assets/images/bagup.png', func: (){},width: 29.w,height: 29.h,),
              Text("7", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 15.sp,
                fontWeight: FontWeight.bold
              ),),
              Text("Retarit total", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 10.sp,
                  color: AppColors.greyColor

              ),)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppColors.secondDarkColor,
              borderRadius: BorderRadius.circular(6.sp)
          ),
          width: 100.w,
          child: Column(
            children: [
              ImageIcone(url: 'assets/images/Group 10779 (1).png', func: (){},width: 29.w,height: 29.h,),
              Text("\$207", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 15.sp,
                fontWeight: FontWeight.bold
              ),),
              Text("Perte totale", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 10.sp,
                  color: AppColors.greyColor
              ),)
            ],
          ),
        ),
      ],
    );
  }
}