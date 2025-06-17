import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupWithButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SignupWithButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Ink(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Image.asset(imagePath, height: 30.h),
        ),
      ),
    );
  }
}
