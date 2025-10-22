import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageIcone extends StatelessWidget {
  final String url;
  final Function() func;
  final double width;
  final double height;
  const ImageIcone({
    super.key,
    required this.url,
    required this.func,
    this.width = 24,
    this.height = 22,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
        child: Image.asset(url, width: width.w, height: height.h,));
  }
}
