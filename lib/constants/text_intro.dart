import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textintro extends StatelessWidget {
  final String text;
  const textintro({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w),
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.colorblack,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
