import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final Function() func;
  const PrimaryButton({super.key, required this.isLoading, required this.func});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading ? AppColors.secondDarkColor : AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: func,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isLoading)...[
              CircularProgressIndicator(
                trackGap: 0.2,
                color: Colors.grey,
              ),
              SizedBox(width: 15.w,),
            ],
            Text(isLoading ? "Connexion en cours" : "Se connecter", style: TextStyle(color: Colors.white, fontFamily: "poppins", fontSize: 14.sp))
          ],
        ),
      ),
    );
  }
}
