import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import 'image_icone.dart';

class SymbolWidget extends StatelessWidget {
  const SymbolWidget({super.key});

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
          child: Column(
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "357", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    fontFamily: "poppins"
                  )),
                  TextSpan(text: " Trades", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 9.sp,
                    fontFamily: "poppins",
                    color: AppColors.greyColor
                  )),
                ]
              )),
              SizedBox(height: 8.h,),
              Text("BTC/ETH", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5.h,),
              Text("Le plus tradé", style: TextStyle(
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
          child: Column(
            children: [
              Text("\$120,45", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 16.sp,
                color: AppColors.succesColor
              ),),
              SizedBox(height: 8.h,),
              Text("BTC/ETH", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5.h,),
              Text("Le plus de gain", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 8.sp,
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
          child: Column(
            children: [
              Text("\$102,45", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 16.sp,
                color: AppColors.errorColor
              ),),
              SizedBox(height: 8.h,),
              Text("BTC/ETH", style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5.h,),
              Text("Le plus de perte", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 8.sp,
                color: AppColors.greyColor
              ),)
            ],
          ),
        ),
      ],
    );
  }
}