import 'package:flutter/material.dart';
import 'package:trading_journey/core/utils/colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
      fontFamily: "poppins",
      color: AppColors.greyColor,
      fontWeight: FontWeight.w500
    ),);
  }
}
