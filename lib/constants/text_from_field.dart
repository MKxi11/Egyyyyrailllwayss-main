import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textfromfield extends StatelessWidget {
  final String hinttext;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const textfromfield({
    super.key,
    required this.hinttext,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    required this.controller,
    this.prefixText,
    this.prefixStyle,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: EdgeInsets.only(left: 30),
        width: 330.w,
        height: 60.h,
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          obscureText: obscureText ?? false,
          style: TextStyle(color: AppColor.colorblack),
          cursorColor: AppColor.colorblue,
          cursorHeight: 20.0.h,
          decoration: InputDecoration(
              prefixText: prefixText,
              prefixStyle: prefixStyle,
              contentPadding: EdgeInsets.only(left: 20.w),
              hintText: hinttext,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(color: AppColor.colorblack, fontSize: 14.sp),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5F6368),
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff0057FF),
                  style: BorderStyle.solid,
                ),
              )),
        ),
      ),
    );
  }
}
