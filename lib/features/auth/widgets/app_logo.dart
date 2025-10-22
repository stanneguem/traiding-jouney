import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/logos/Logo - 6.png"),
        const SizedBox(width: 8),
        const Text(
          "Trader journey",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            fontFamily: "poppins"
          ),
        ),
      ],
    );
  }
}
