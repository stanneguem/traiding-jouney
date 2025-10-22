import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_journey/core/utils/colors.dart';
import 'image_icone.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          // 🔹 Builder crée un nouveau contexte lié au Scaffold
          builder: (innerContext) => Row(
            children: [
              ImageIcone(
                url: 'assets/images/Menu 04.png',
                func: () {
                  Scaffold.of(innerContext).openDrawer(); // ✅ fonctionne maintenant
                },
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: "poppins",
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    "Dona",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "poppins",
                      color: AppColors.lightColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            ImageIcone(
              url: 'assets/images/Notifications (1).png',
              func: () {},
            ),
            SizedBox(width: 15.w),
            ImageIcone(
              url: 'assets/images/Settings.png',
              func: () {},
            ),
          ],
        ),
      ],
    );
  }
}
