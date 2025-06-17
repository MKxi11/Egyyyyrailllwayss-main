import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class container1_help extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final IconData? icon;

  const container1_help({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
      width: 180.w,
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(colors: [
            Colors.cyan,
            const Color.fromARGB(255, 14, 70, 117),
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.cyan,
              child: Icon(
                icon,
                // Icons.phone_outlined,
                size: 20.sp,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              child: Text(text1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              child: Text(text2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  )),
            ),
            Container(
              child: Text(text3,
                  style: TextStyle(
                    color: const Color.fromARGB(170, 255, 255, 255),
                    fontSize: 11.sp,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
