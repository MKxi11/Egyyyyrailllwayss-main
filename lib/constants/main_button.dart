import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mainbutton extends StatelessWidget {
  final String text1;
  final void Function()? onPressed;
  const mainbutton({
    super.key,
    required this.text1,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 0, 107, 156),
              Color.fromARGB(255, 0, 51, 152),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(text1,
              style: TextStyle(color: AppColor.colorwhite, fontSize: 20 .sp)),
        ),
      ),
    );
  }
}
