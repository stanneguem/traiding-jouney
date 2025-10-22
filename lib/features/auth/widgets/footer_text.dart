import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: "En vous inscrivant, vous acceptez ",
        children: [
          TextSpan(
            text: "les conditions de service ",
            style:  TextStyle(color: AppColors.lightColor, fontSize: 12, fontFamily: "poppins"),
          ),
          const TextSpan(text: "et "),
          TextSpan(
            text: "l'accord sur le traitement des données.",
            style:  TextStyle(color: AppColors.lightColor, fontSize: 12, fontFamily: "poppins"),
          ),
        ],
      ),
      style: const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "poppins"),
    );
  }
}
