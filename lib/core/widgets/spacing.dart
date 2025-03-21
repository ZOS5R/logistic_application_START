import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceH extends StatelessWidget {
  final double num;

  const SpaceH({
    Key? key,
    this.num = 0.0, // Default value added here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: num.h, // Responsive spacing
    );
  }
}

class SpaceW extends StatelessWidget {
  final double num;

  const SpaceW({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: num.w,
    );
  }
}

class PaddingValues {
  // Define your padding values
  static double hP = 25.w;
  static double hPi = 18.w;
  static double navIconP = 12.h;
  static double navTextP = 4.h;
  static double navTextbP = 8.h;

  // Method to get EdgeInsets for horizontal padding
}
