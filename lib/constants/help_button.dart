import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class help_button extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final void Function()? onPressed;

  const help_button({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 20.h),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.r,
              offset: Offset(0, 3.h),
            ),
          ],
          gradient: LinearGradient(colors: [
            Colors.cyan,
            const Color.fromARGB(255, 14, 70, 117),
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ),
    );
  }
}
