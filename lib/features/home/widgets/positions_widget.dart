import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class PositionsWidget extends StatelessWidget {
  const PositionsWidget({super.key});

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
          height: 148.h,
          width: 178.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("13", style: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20.sp
              ),),
              SizedBox(height: 5.h,),
              Text("Positions totales", style: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: AppColors.greyColor
              ),),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.succesColor,
                  borderRadius: BorderRadius.circular(4.r)
                ),
                child: Text("43% de reussite", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "poppins",
                  fontSize: 12.sp
                ),),
              )
            ],
          ),
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
                  Row(
                    children: [
                      Text("7 (60%)", style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: Colors.white
                      ),),
                      Icon(Icons.arrow_downward_rounded, color: AppColors.primaryColor,)
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text("Position d’achat", style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: AppColors.greyColor
                  ),),
                ],
              ),
            ),
            SizedBox(height: 12.h,),
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
                  Row(
                    children: [
                      Text("7 (60%)", style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: Colors.white
                      ),),
                      Icon(Icons.arrow_upward_sharp, color: AppColors.primaryColor,)
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text("Position de ventes", style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: AppColors.greyColor
                  ),),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}