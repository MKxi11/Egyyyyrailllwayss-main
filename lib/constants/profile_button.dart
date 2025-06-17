import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class profile_button extends StatelessWidget {
  final Gradient? gradient;
  final IconData? icon;
  final Color? coloricon;
  final Color colortext;
  final Color? colorcontainer;
  final String text;
  final FontWeight? fontWeight;
  final BoxBorder? border;
  final void Function() onPressed;
  const profile_button({
    super.key,
    this.gradient,
    this.icon,
    this.coloricon,
    required this.text,
    required this.colortext,
    this.colorcontainer,
    this.border,
    required this.onPressed,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 250.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: border,
            gradient: gradient,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: coloricon,
                size: 20.sp,
              ),
              // Icon(
              //   Icons.edit_outlined,
              //   color: coloricon,
              //   size: 20.sp,
              // ),
              MaterialButton(
                onPressed: onPressed,
                child: Text(text,
                    style: TextStyle(
                      color: colortext,
                      fontSize: 16.sp,
                      fontWeight: fontWeight,
                    )),
              )
            ],
          )),
    );
  }
}
