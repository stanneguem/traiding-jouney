import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.secondDarkColor,
          borderRadius: BorderRadius.circular(6.sp)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Emmanuel leuna", style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 13.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("67834928-98", style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: "poppins",
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Der. mise à jour", style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 12.sp,
                      color: AppColors.greyColor
                  ),),
                  Text("10/10/2-24", style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "poppins",
                      color: AppColors.greyColor
                  ),),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Capital", style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 12.sp,
                      color: AppColors.greyColor
                  ),),
                  SizedBox(width: 5.w,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4.r)
                    ),
                    child: Text("Demo", style: TextStyle(color: AppColors.primaryColor, fontSize: 12.sp, fontFamily: "poppins"),),
                  )
                ],
              ),
              SizedBox(height: 5.h,),
              Text("\$3,45600", style: TextStyle(
                fontFamily: "poppins",
                fontSize: 31.sp,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Column(
                  children: [
                    Text("Pourcentage d’exposition", style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: "poppins",
                        color: AppColors.greyColor
                    ),),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2,3%", style: TextStyle(
                                color: AppColors.succesColor,
                              fontSize: 12.sp,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 2.w,),
                            Icon(Icons.arrow_upward_sharp, color: AppColors.succesColor,size: 13.sp,)
                          ],
                        ),
                        Text("\$20", style: TextStyle(
                            fontSize: 12.sp,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold
                        ))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Column(
                  children: [
                    Text("Gain / Perte en cours", style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: "poppins",
                        color: AppColors.greyColor
                    ),),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2,3%", style: TextStyle(
                                color: AppColors.errorColor,
                              fontSize: 12.sp,
                              fontFamily: "poppins"
                            ),),
                            SizedBox(width: 2.w,),
                            Icon(Icons.arrow_downward_rounded, color: AppColors.errorColor,size: 13.sp,)
                          ],
                        ),
                        Text("\$20", style: TextStyle(
                            fontSize: 12.sp,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}